FROM php:7.0-fpm

RUN apt-get update && apt-get install -y software-properties-common make wget git zlib1g-dev libsqlite3-dev

RUN docker-php-ext-install mbstring zip pdo pdo_sqlite
RUN wget -O /usr/bin/composer https://getcomposer.org/download/1.2.0/composer.phar
RUN chmod +x /usr/bin/composer

ARG COMPOSER_HOME=/tmp/composer
ENV COMPOSER_HOME ${COMPOSER_HOME}

WORKDIR /simple-prepaid-card