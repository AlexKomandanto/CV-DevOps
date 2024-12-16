#!/bin/sh

CERT_DIR="/etc/letsencrypt/live/$DOMAIN"

# Переменная $DOMAIN берется из окружения
DOMAIN=${DOMAIN:-localhost}

if [ ! -f "$CERT_DIR/fullchain.pem" ] || [ ! -f "$CERT_DIR/privkey.pem" ]; then
    echo "Generating self-signed certificate for $DOMAIN..."
    mkdir -p "$CERT_DIR"
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout "$CERT_DIR/privkey.pem" \
        -out "$CERT_DIR/fullchain.pem" \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=Example/OU=IT Department/CN=$DOMAIN"
    echo "Certificate generated."
else
    echo "Certificate already exists."
fi
