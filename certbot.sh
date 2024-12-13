#!/bin/bash

if ! [ -x "$(command -v certbot)" ]; then
  echo 'Error: certbot is not installed.' >&2
  exit 1
fi

certbot certonly --webroot --webroot-path=/var/www/certbot \
  --email aleexkomendantov@gmail.com --agree-tos --no-eff-email \
  -d алексейкомендантов.ком.рф -d www.алексейкомендантов.ком.рф