FROM debian:latest

# Установка Nginx, Certbot и зависимостей
RUN apt-get update && apt-get install -y nginx certbot python3-certbot-nginx && apt-get clean

# Остальная конфигурация остается неизменной
COPY index.html /usr/share/nginx/html/
COPY /css/style.css /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/sites-enabled/default

# Создание директорий для Certbot
RUN mkdir -p /var/www/certbot /etc/letsencrypt

WORKDIR /usr/share/nginx/html

