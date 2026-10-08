\# Lab 4: Environment Variables \& Configuration



\## 📌 Цель работы

Настройка Flask-приложения с использованием переменных окружения (.env), раздельных окружений (development и production), валидации и безопасной работы с Docker-сетями.



\## 🚀 Быстрый запуск



\### 1. Сборка образа

docker build -t config-app .



\### 2. Запуск Development режима

docker run -d --name dev-postgres -e POSTGRES\_USER=devuser -e POSTGRES\_PASSWORD=devpassword123 -e POSTGRES\_DB=devdb -p 5432:5432 postgres:15-alpine

docker run -d --name config-app-dev --env-file .env.development -p 5002:5000 config-app



\### 3. Запуск Production режима (Docker Network)

docker network create app-network

docker run -d --name prod-postgres --network app-network -e POSTGRES\_USER=produser -e POSTGRES\_PASSWORD=CHANGE\_ME\_STRONG\_PASSWORD -e POSTGRES\_DB=proddb postgres:15-alpine

docker run -d --name config-app-prod --network app-network --env-file .env.production -p 5001:5000 config-app

