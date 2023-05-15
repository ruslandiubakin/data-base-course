# Використовуємо офіційний образ Python в якості базового
FROM python:3.9

# Переходимо в директорію з файлами
WORKDIR /app

# Завантаження потрібних залежностей для роботи Python та бази даних
RUN pip install --upgrade pip
COPY requirements.txt /app
RUN pip install -r requirements.txt

# Додаємо файли додатку в репозиторій докеру
COPY . /app/

# Запускаємо скрипт заповнення бази даних та запиту до неї
CMD python main.py