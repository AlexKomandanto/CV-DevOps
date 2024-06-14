FROM nginx:alpine

RUN apk add --no-cache certbot bash certbot-nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY certbot.sh /usr/local/bin/certbot.sh
RUN chmod +x /usr/local/bin/certbot.sh

CMD ["bash", "-c", "/usr/local/bin/certbot.sh && nginx -g 'daemon off;'"]
