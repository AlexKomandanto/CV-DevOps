# Используем официальный образ nginx в качестве базового образа
FROM nginx:alpine

# Удаляем стандартный конфигурационный файл nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копируем наш конфигурационный файл nginx в контейнер
COPY nginx.conf /etc/nginx/conf.d/

# Копируем содержимое вашего веб-сайта в директорию, обслуживаемую nginx
COPY . /usr/share/nginx/html

# Указываем, что контейнер будет слушать 80 порт
EXPOSE 80

# Запуск nginx
CMD ["nginx", "-g", "daemon off;"]
