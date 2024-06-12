# # Используем официальный образ nginx в качестве базового образа
# FROM nginx:alpine

# # Удаляем стандартный конфигурационный файл nginx
# RUN rm /etc/nginx/conf.d/default.conf

# # Копируем наш конфигурационный файл nginx в контейнер
# COPY nginx.conf /etc/nginx/conf.d/

# # Копируем содержимое вашего веб-сайта в директорию, обслуживаемую nginx
# COPY . /usr/share/nginx/html

# # Указываем, что контейнер будет слушать 80 порт
# EXPOSE 80

# # Запуск nginx
# CMD ["nginx", "-g", "daemon off;"]
FROM nginx:alpine

RUN apk add --no-cache certbot bash

COPY nginx.conf /etc/nginx/nginx.conf
COPY certbot.sh /usr/local/bin/certbot.sh
RUN chmod +x /usr/local/bin/certbot.sh

CMD ["bash", "-c", "/usr/local/bin/certbot.sh && nginx -g 'daemon off;'"]
