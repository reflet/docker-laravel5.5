#!/bin/bash

if [[ ! -e /var/www/www.example.com/.env ]]; then
  cd /var/www/www.example.com/
  cp .env.example .env
  php artisan key:generate
fi

php-fpm
