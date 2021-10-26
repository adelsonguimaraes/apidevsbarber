#!/bin/bash
FROM php:7.4-fpm-alpine AS apidevbarber
LABEL name="apidevbarber"
LABEL maintainer = "Adelson Guimarães"

WORKDIR /var/www

RUN apk update \
# php ini
&& mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
# gd
&& apk add \
git \
curl \
libpng-dev \
# libonig-dev \
oniguruma-dev \
libxml2-dev \
zip \
unzip \
bash \
# clean up
&& rm -f /var/cache/apk/* \
&& rm -rf /tmp/pear/

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# criando usuario do grupo www-data e adicionando permissões as pastas
RUN addgroup www-data www-data \
    && chown -R www-data:www-data \
    /var/www/storage \
    /var/www/bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]