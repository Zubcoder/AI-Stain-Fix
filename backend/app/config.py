from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    app_name: str = "AI Stain Fix API"
    debug: bool = False
    host: str = "0.0.0.0"
    port: int = 8000

    # Gemini AI
    gemini_api_key: str = ""

    # Retry settings
    gemini_max_retries: int = 3
    gemini_timeout: int = 30

    # Cache TTL in seconds
    cache_ttl: int = 3600

    # Rate limiting
    rate_limit_per_minute: int = 30

    model_config = {"env_file": ".env", "env_prefix": "STAINFIX_"}


settings = Settings()
