# Інструкція

Для запуску виконати наступну команду

```bach
docker-compose build --no-cache && docker-compose up -d --force-recreate
```

Після завантаження даних до бази даних, запустити flyway-migrate для міграції бази даних.
Після міграцій запустити app_query для виконання запиту до нової схеми бази даних.