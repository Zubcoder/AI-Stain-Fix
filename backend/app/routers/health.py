import logging
from datetime import datetime, timezone

import httpx
from fastapi import APIRouter

from ..config import settings

router = APIRouter(tags=["Health"])
logger = logging.getLogger(__name__)


@router.get("/health")
async def health_check():
    """Health check endpoint for monitoring."""
    checks: dict[str, str] = {}

    try:
        async with httpx.AsyncClient(timeout=5) as client:
            resp = await client.get(
                "https://generativelanguage.googleapis.com/v1beta/models"
                f"?key={settings.gemini_api_key}"
            )
            checks["gemini_api"] = "ok" if resp.status_code == 200 else "degraded"
    except Exception:
        checks["gemini_api"] = "unavailable"

    status = "healthy" if checks.get("gemini_api") == "ok" else "degraded"

    return {
        "status": status,
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "version": "1.0.0",
        "checks": checks,
    }
