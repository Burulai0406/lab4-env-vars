FROM python:3.11-slim

WORKDIR /app

# Зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Код
COPY config.py app.py ./

# Значения по умолчанию
ENV APP_ENV=production
ENV DEBUG=false
ENV FLASK_APP=app.py

EXPOSE 5000

# Непривилегированный пользователь для безопасности
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser

CMD ["python", "app.py"]
