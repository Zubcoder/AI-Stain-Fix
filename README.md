# AI Stain Fix (Пятновыводитель)

Фото пятна → AI определяет тип загрязнения → чем вывести + пошаговая инструкция в зависимости от типа ткани.

## Возможности

- Анализ пятна по фото с помощью Gemini Vision AI
- Определение типа загрязнения (жир, вино, кровь, чернила, ржавчина и др.)
- Определение типа ткани (хлопок, шёлк, синтетика, шерсть и др.)
- Пошаговая инструкция по удалению пятна
- Рекомендации бытовых и профессиональных средств
- Предупреждения (что НЕ делать с конкретной тканью)
- История анализов
- Локализация RU/EN

## Технологии

- Flutter 3.x (Dart 3.x)
- FastAPI (Python 3.11+)
- Google Gemini 2.5 Flash (Vision AI)
- Provider (State Management)
- Fly.io (Backend hosting)

## Установка

```bash
flutter pub get
flutter run
```

## Backend

```bash
cd backend
pip install .
uvicorn app.main:app --reload
```

Или через Docker:

```bash
cd backend
docker build -t stainfix-api .
docker run -e STAINFIX_GEMINI_API_KEY=your_key -p 8000:8000 stainfix-api
```

## Монетизация

| Пакет | Количество | Цена |
|---|---|---|
| Бесплатно | 3 анализа/день | 0 ₽ |
| Капля | 10 анализов | 79 ₽ |
| Стирка | 25 анализов | 179 ₽ |
| Химчистка | 50 анализов | 329 ₽ |
| PRO месяц | Безлимит | 149 ₽/мес |
| PRO год | Безлимит | 1 190 ₽/год |

## Публикация

1. Keystore: `keytool -genkey -v -keystore stainfix-release.keystore -alias stainfix -keyalg RSA -keysize 2048 -validity 10000`
2. APK: `flutter build apk --release --obfuscate --split-debug-info=debug-info/`
3. Загрузить в console.rustore.ru

## Архитектура

Разработано по спецификации «Ветхий Завет» v2.0 — единая архитектура для линейки AI-камера приложений.
