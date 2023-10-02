# Используем базовый образ Python
FROM python:3.10

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем requirements.txt
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Копирование проекта в контейнер
COPY . /app

# Копирование статических файлов в контейнер
COPY ./static /app/static

# Запускаем команду для миграции базы данных
RUN python manage.py migrate

# Открываем порт 8000 для доступа к приложению
EXPOSE 8000

# Запускаем сервер Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]