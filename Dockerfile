FROM nginx:alpine

# Копируем файлы сайта в директорию, которую обслуживает Nginx
COPY index.html /usr/share/nginx/html/
COPY /css/style.css /usr/share/nginx/html/

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Создание директорий для Certbot
RUN mkdir -p /var/www/certbot /etc/letsencrypt

# Экспонируем порты 80 и 443
EXPOSE 80 443

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]