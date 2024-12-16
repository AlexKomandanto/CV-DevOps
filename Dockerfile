# FROM nginx:alpine

# # Копируем файлы сайта в директорию, которую обслуживает Nginx
# COPY index.html /usr/share/nginx/html/
# COPY /css/style.css /usr/share/nginx/html/

# # Копируем конфигурацию Nginx
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# # Создание директорий для Certbot
# RUN mkdir -p /var/www/certbot /etc/letsencrypt

# # Экспонируем порты 80 и 443
# EXPOSE 80 443

# # Запускаем Nginx
# CMD ["nginx", "-g", "daemon off;"]

FROM nginx:alpine

# Установить OpenSSL
RUN apk add --no-cache openssl

# Скопировать проект
COPY . /usr/share/nginx/html

# Скопировать скрипт генерации сертификата
COPY generate-cert.sh /usr/local/bin/generate-cert.sh
RUN chmod +x /usr/local/bin/generate-cert.sh

# Скопировать конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Определить переменную окружения для домена
ENV DOMAIN=localhost

# Запустить генерацию сертификата и Nginx
CMD /usr/local/bin/generate-cert.sh && nginx -g "daemon off;"