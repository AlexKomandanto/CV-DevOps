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



# FROM nginx:alpine

# # Установить OpenSSL
# RUN apk add --no-cache openssl

# # Скопировать проект
# COPY . /usr/share/nginx/html

# # Скопировать скрипт генерации сертификата
# COPY generate-cert.sh /usr/local/bin/generate-cert.sh
# RUN chmod +x /usr/local/bin/generate-cert.sh

# # Скопировать конфигурацию Nginx
# COPY nginx.conf /etc/nginx/nginx.conf

# # Определить переменную окружения для домена
# ENV DOMAIN=localhost

# # Запустить генерацию сертификата и Nginx
# CMD /usr/local/bin/generate-cert.sh && nginx -g "daemon off;"

FROM nginx:alpine

# Установить OpenSSL для генерации самоподписного сертификата
RUN apk add --no-cache openssl

# Скопировать HTML-файлы и конфигурацию
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

# Генерация сертификата перед запуском Nginx
RUN mkdir -p /etc/letsencrypt/live/алексейкомендантов.ком.рф

CMD ["/bin/sh", "-c", "\
    if [ ! -f /etc/letsencrypt/live/алексейкомендантов.ком.рф/fullchain.pem ]; then \
        echo 'Generating self-signed certificate...'; \
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/letsencrypt/live/алексейкомендантов.ком.рф/privkey.pem \
        -out /etc/letsencrypt/live/алексейкомендантов.ком.рф/fullchain.pem \
        -subj '/C=RU/ST=Moscow/L=Moscow/O=Example/OU=IT Department/CN=алексейкомендантов.ком.рф'; \
    fi && nginx -g 'daemon off;'"]
