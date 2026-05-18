"""Gemini AI proxy — stain analysis via server-side API key."""

import base64
import json
import logging

import httpx
from fastapi import APIRouter, HTTPException

from ..config import settings
from ..models.schemas import AnalyzeRequest, AiResponse

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
