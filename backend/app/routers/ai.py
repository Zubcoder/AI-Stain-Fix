"""Gemini AI proxy — stain analysis via server-side API key."""

import base64
import json
import logging

import httpx
from fastapi import APIRouter, HTTPException

from ..config import settings
from ..models.schemas import AnalyzeRequest, AiResponse, ChatRequest, ChatResponse

router = APIRouter(prefix="/api/v1/ai", tags=["AI"])
logger = logging.getLogger(__name__)

GEMINI_API_URL = (
    "https://generativelanguage.googleapis.com/v1beta/models/"
    "gemini-2.5-flash:generateContent"
)

STAIN_PROMPT_RU = (
    "Ты — эксперт по удалению пятен и уходу за тканями. "
    "Проанализируй фото и определи:\n"
    "1) Тип пятна (загрязнения)\n"
    "2) Тип ткани (если видно)\n"
    "3) Сложность удаления\n"
    "4) Пошаговую инструкцию по удалению\n"
    "5) Рекомендуемые средства (доступные в быту)\n"
    "6) Предупреждения (что НЕ делать)\n\n"
    "Верни ответ СТРОГО в формате JSON без markdown-разметки:\n"
    "{\n"
    '  "stain_type": "Тип пятна на русском",\n'
    '  "fabric_type": "Тип ткани на русском",\n'
    '  "difficulty": "Легко/Средне/Сложно",\n'
    '  "difficulty_level": 1,\n'
    '  "steps": [\n'
    '    "Шаг 1: описание",\n'
    '    "Шаг 2: описание",\n'
    '    "Шаг 3: описание"\n'
    "  ],\n"
    '  "products": ["Средство 1", "Средство 2"],\n'
    '  "warnings": ["Предупреждение 1"],\n'
    '  "summary": "Краткое резюме на русском в 1-2 предложения"\n'
    "}\n\n"
    "difficulty_level: 1 = легко, 2 = средне, 3 = сложно.\n"
    "Отвечай ТОЛЬКО на русском языке.\n"
    "Инструкции должны быть практичными, с использованием бытовых средств."
)

STAIN_PROMPT_EN = (
    "You are an expert in stain removal and fabric care. "
    "Analyze the photo and determine:\n"
    "1) Stain type\n"
    "2) Fabric type (if visible)\n"
    "3) Removal difficulty\n"
    "4) Step-by-step removal instructions\n"
    "5) Recommended products (commonly available household items)\n"
    "6) Warnings (what NOT to do)\n\n"
    "Return the answer STRICTLY in JSON format without markdown:\n"
    "{\n"
    '  "stain_type": "Stain type in English",\n'
    '  "fabric_type": "Fabric type in English",\n'
    '  "difficulty": "Easy/Medium/Hard",\n'
    '  "difficulty_level": 1,\n'
    '  "steps": [\n'
    '    "Step 1: description",\n'
    '    "Step 2: description",\n'
    '    "Step 3: description"\n'
    "  ],\n"
    '  "products": ["Product 1", "Product 2"],\n'
    '  "warnings": ["Warning 1"],\n'
    '  "summary": "Brief summary in English in 1-2 sentences"\n'
    "}\n\n"
    "difficulty_level: 1 = easy, 2 = medium, 3 = hard.\n"
    "Respond ONLY in English.\n"
    "Instructions should be practical, using commonly available household products."
)

STAIN_PROMPTS = {
    "ru": STAIN_PROMPT_RU,
    "en": STAIN_PROMPT_EN,
}

FABRIC_PROMPT_RU = (
    "Ты — эксперт по текстилю и уходу за одеждой. "
    "Проанализируй фотографию ткани/одежды и определи:\n\n"
    "1. Тип ткани (хлопок, лён, шёлк, шерсть, кашемир, полиэстер, нейлон, вискоза, ацетат, смесовая)\n"
    "2. Подтип (сатин, бязь, поплин, твид, джерси, шифон, атлас и т.д.)\n"
    "3. Плотность (лёгкая, средняя, плотная)\n"
    "4. Рекомендации по стирке\n"
    "5. Расшифровка символов на ярлыке (если виден ярлык)\n\n"
    "РЕЖИМЫ:\n"
    "- ТКАНЬ крупным планом → определи тип по текстуре\n"
    "- ОДЕЖДА целиком → тип ткани + общие рекомендации\n"
    "- ЯРЛЫК с символами → расшифруй символы стирки\n\n"
    "ВАЖНО:\n"
    '- Если на фото НЕ ткань/одежда — верни {"error": "not_fabric"}\n'
    "- Для точного состава нужен ярлык — напомни\n"
    "- Рекомендации безопасные (лучше занизить температуру)\n\n"
    "Ответ строго в JSON:\n"
    "{\n"
    '  "fabric_type": "Шерсть",\n'
    '  "fabric_subtype": "Мериносовая, тонкая",\n'
    '  "density": "Средняя",\n'
    '  "composition_estimate": "90% шерсть, 10% эластан (примерно)",\n'
    '  "care_instructions": {\n'
    '    "washing": {"temperature": "30°C макс", "mode": "Деликатный / ручная", "detergent": "Жидкое для шерсти"},\n'
    '    "drying": {"machine": false, "method": "Горизонтально на полотенце"},\n'
    '    "ironing": {"temperature": "До 150°C", "method": "Через влажную ткань"},\n'
    '    "forbidden": ["Отбеливатель", "Сушка в барабане", "Выжимание скручиванием", "Выше 40°C"]\n'
    "  },\n"
    '  "label_symbols": null,\n'
    '  "stain_removal_tip": "Для шерсти: холодная вода + нейтральное мыло. Не тереть — промакивать.",\n'
    '  "disclaimer": "Визуальная оценка. Точный состав — на ярлыке.",\n'
    '  "confidence": 0.80\n'
    "}\n\n"
    'Если виден ярлык — добавь "label_symbols": [{"symbol": "описание символа", "meaning": "что означает"}].\n'
    "Отвечай ТОЛЬКО на русском языке."
)

FABRIC_PROMPT_EN = (
    "You are a textile and garment care expert. "
    "Analyze the fabric/clothing photo and determine:\n\n"
    "1. Fabric type (cotton, linen, silk, wool, cashmere, polyester, nylon, viscose, blend)\n"
    "2. Subtype (satin, calico, tweed, jersey, chiffon, etc.)\n"
    "3. Density (light, medium, heavy)\n"
    "4. Care instructions\n"
    "5. Care label symbols (if visible)\n\n"
    "MODES:\n"
    "- FABRIC close-up → identify by texture\n"
    "- CLOTHING full → fabric type + general care\n"
    "- CARE LABEL → decode washing symbols\n\n"
    "IMPORTANT:\n"
    '- Not fabric → {"error": "not_fabric"}\n'
    "- For exact composition, remind about care label\n"
    "- Safe recommendations (lower temperature is better)\n\n"
    "Response in JSON:\n"
    "{\n"
    '  "fabric_type": "Wool",\n'
    '  "fabric_subtype": "Merino, fine",\n'
    '  "density": "Medium",\n'
    '  "composition_estimate": "~90% wool, 10% elastane",\n'
    '  "care_instructions": {\n'
    '    "washing": {"temperature": "30°C max", "mode": "Delicate / hand wash", "detergent": "Liquid wool detergent"},\n'
    '    "drying": {"machine": false, "method": "Flat on towel"},\n'
    '    "ironing": {"temperature": "Up to 150°C", "method": "Through damp cloth"},\n'
    '    "forbidden": ["Bleach", "Tumble dry", "Wringing", "Above 40°C"]\n'
    "  },\n"
    '  "label_symbols": null,\n'
    '  "stain_removal_tip": "For wool: cold water + mild soap. Blot, don\'t rub.",\n'
    '  "disclaimer": "Visual assessment. Exact composition is on the care label.",\n'
    '  "confidence": 0.80\n'
    "}\n\n"
    'If care label visible — add "label_symbols": [{"symbol": "symbol desc", "meaning": "what it means"}].\n'
    "Respond ONLY in English."
)

FABRIC_PROMPTS = {
    "ru": FABRIC_PROMPT_RU,
    "en": FABRIC_PROMPT_EN,
}


async def _call_gemini(parts: list[dict]) -> dict:
    """Call Gemini API with given content parts."""
    if not settings.gemini_api_key:
        raise HTTPException(status_code=503, detail="Gemini API key not configured")

    url = f"{GEMINI_API_URL}?key={settings.gemini_api_key}"

    payload = {
        "contents": [{"parts": parts}],
        "generationConfig": {
            "temperature": 0.2,
            "maxOutputTokens": 4096,
        },
    }

    async with httpx.AsyncClient(timeout=float(settings.gemini_timeout)) as client:
        resp = await client.post(url, json=payload)

    if resp.status_code != 200:
        logger.error("Gemini API error %s: %s", resp.status_code, resp.text[:300])
        raise HTTPException(status_code=502, detail="Gemini API error")

    result = resp.json()
    candidates = result.get("candidates", [])
    if not candidates:
        raise HTTPException(status_code=502, detail="No response from Gemini")

    text = candidates[0].get("content", {}).get("parts", [{}])[0].get("text", "")

    # Strip markdown code fences if present
    text = text.strip()
    if text.startswith("```"):
        lines = text.split("\n")
        lines = lines[1:]
        if lines and lines[-1].strip() == "```":
            lines = lines[:-1]
        text = "\n".join(lines)

    try:
        data = json.loads(text)
    except json.JSONDecodeError:
        logger.warning("Failed to parse Gemini response as JSON: %s", text[:200])
        return {"raw_text": text}

    return data


@router.post("/analyze", response_model=AiResponse)
async def analyze_stain(req: AnalyzeRequest):
    """Analyze a stain from image via Gemini AI proxy."""
    try:
        image_bytes = base64.b64decode(req.image_base64)
    except Exception:
        raise HTTPException(status_code=400, detail="Invalid base64 image")

    prompt = STAIN_PROMPTS.get(req.language, STAIN_PROMPT_RU)
    if req.fabric_hint:
        hint_label = "User hint about fabric" if req.language == "en" else "Подсказка пользователя о ткани"
        prompt += f"\n\n{hint_label}: {req.fabric_hint}"

    parts: list[dict] = [
        {"text": prompt},
        {
            "inline_data": {
                "mime_type": "image/jpeg",
                "data": base64.b64encode(image_bytes).decode(),
            }
        },
    ]

    data = await _call_gemini(parts)
    return AiResponse(success=True, data=data)


@router.post("/fabric-inspect", response_model=AiResponse)
async def inspect_fabric(req: AnalyzeRequest):
    """Inspect fabric type and care instructions via Gemini AI."""
    try:
        image_bytes = base64.b64decode(req.image_base64)
    except Exception:
        raise HTTPException(status_code=400, detail="Invalid base64 image")

    prompt = FABRIC_PROMPTS.get(req.language, FABRIC_PROMPT_RU)

    parts: list[dict] = [
        {"text": prompt},
        {
            "inline_data": {
                "mime_type": "image/jpeg",
                "data": base64.b64encode(image_bytes).decode(),
            }
        },
    ]

    data = await _call_gemini(parts)
    return AiResponse(success=True, data=data)


CHAT_SYSTEM_RU = (
    "Ты — эксперт по удалению пятен и уходу за тканями приложения Пятновыводитель. "
    "Отвечай на вопросы о пятнах, стирке, уходе за одеждой и тканями. "
    "Давай конкретные бытовые рекомендации. Будь дружелюбным и лаконичным. "
    "Если вопрос не связан с тканями — вежливо направь к теме. Отвечай на русском."
)

CHAT_SYSTEM_EN = (
    "You are a stain removal and fabric care expert for the Stain Fix app. "
    "Answer questions about stains, laundry, clothing and fabric care. "
    "Give specific household recommendations. Be friendly and concise. "
    "If question is not about fabrics — politely redirect. Answer in English."
)


@router.post("/chat", response_model=ChatResponse)
async def chat(req: ChatRequest):
    """AI chat for stain removal and fabric care questions."""
    system_prompt = CHAT_SYSTEM_RU if req.language == "ru" else CHAT_SYSTEM_EN

    chat_parts: list[dict] = [{"text": system_prompt}]

    for msg in req.history[-10:]:
        prefix = "Пользователь: " if msg.role == "user" else "Ассистент: "
        chat_parts.append({"text": prefix + msg.text})

    user_text = ("Пользователь: " if req.language == "ru" else "User: ") + req.message
    chat_parts.append({"text": user_text})

    if req.image_base64:
        try:
            image_bytes = base64.b64decode(req.image_base64)
            chat_parts.append({
                "inline_data": {
                    "mime_type": "image/jpeg",
                    "data": base64.b64encode(image_bytes).decode(),
                }
            })
        except Exception:
            raise HTTPException(status_code=400, detail="Invalid base64 image")

    payload = {"contents": [{"parts": chat_parts}]}
    try:
        async with httpx.AsyncClient(timeout=60.0) as client:
            resp = await client.post(
                GEMINI_API_URL,
                params={"key": settings.gemini_api_key},
                json=payload,
            )
            resp.raise_for_status()
            data = resp.json()
            text = data["candidates"][0]["content"]["parts"][0]["text"]
            return ChatResponse(success=True, reply=text)
    except Exception as e:
        logger.error("Chat error: %s", str(e))
        raise HTTPException(status_code=500, detail=str(e))
