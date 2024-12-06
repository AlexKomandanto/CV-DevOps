# FROM nginx:alpine

# RUN apk add --no-cache certbot bash certbot-nginx

# COPY nginx.conf /etc/nginx/nginx.conf
# COPY certbot.sh /usr/local/bin/certbot.sh
# RUN chmod +x /usr/local/bin/certbot.sh

# CMD ["bash", "-c", "/usr/local/bin/certbot.sh && nginx -g 'daemon off;'"]

# Используем официальный образ Nginx
FROM nginx:alpine

# Копируем файлы сайта в директорию, которую обслуживает Nginx
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Экспонируем порты 80 и 443
EXPOSE 80 443

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
