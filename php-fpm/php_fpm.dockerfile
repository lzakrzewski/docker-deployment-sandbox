FROM php:7.0-fpm

RUN apt-get update \
    && apt-get install -y software-properties-common make wget git zlib1g-dev libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mbstring zip pdo pdo_sqlite
RUN wget -O /usr/bin/composer https://getcomposer.org/download/1.2.0/composer.phar \
    && chmod +x /usr/bin/composer

ARG COMPOSER_HOME=/tmp/composer
ENV COMPOSER_HOME ${COMPOSER_HOME}

ENV REDIS_HOST redis
ENV REDIS_PORT 6379

COPY php-fpm/setup-permissions.sh /setup-permissions.sh
COPY php-fpm/www.conf /etc/php/7.0/fpm/pool.d/www.conf

COPY simple-prepaid-card /simple-prepaid-card
COPY php-fpm/parameters.yml /simple-prepaid-card/app/config/parameters.yml

WORKDIR /simple-prepaid-card

RUN composer install -n
RUN /setup-permissions.sh

EXPOSE 9000