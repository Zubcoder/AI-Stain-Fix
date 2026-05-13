from pydantic import BaseModel, Field


class AnalyzeRequest(BaseModel):
    image_base64: str = Field(..., description="Base64-encoded image (JPEG/PNG)")
    fabric_hint: str | None = Field(
        default=None,
        description="Optional fabric type hint from user",
    )


class AiResponse(BaseModel):
    success: bool
    data: dict | None = None
    error: str | None = None
