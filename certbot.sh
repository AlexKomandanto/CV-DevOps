#!/bin/bash

# Стартуем Certbot для получения SSL сертификатов
certbot certonly --webroot --webroot-path=/var/www/certbot --email aleexkomendantov@gmail.com --agree-tos --no-eff-email -d alexkomendantov.top -d www.alexkomendantov.top

# Устанавливаем cron задание для автоматического обновления сертификатов
echo "0 0 * * * certbot renew --quiet --renew-hook 'nginx -s reload'" | crontab -

# Стартуем cron
crond
