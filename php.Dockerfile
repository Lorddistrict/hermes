FROM composer:2  as vendors

WORKDIR /app

COPY ./app/composer.json .

RUN composer install --ignore-platform-reqs --no-scripts


FROM php:8.2-fpm-alpine

WORKDIR /app

COPY --from=vendors /app/vendor ./vendor
COPY ./app/src .
