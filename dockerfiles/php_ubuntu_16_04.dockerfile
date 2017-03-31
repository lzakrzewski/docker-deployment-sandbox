FROM php:7.0-fpm

RUN apt-get update && apt-get install -y software-properties-common make wget git zlib1g-dev libsqlite3-dev

RUN docker-php-ext-install mbstring zip pdo pdo_sqlite
RUN wget -O /usr/bin/composer https://getcomposer.org/download/1.2.0/composer.phar
RUN chmod +x /usr/bin/composer

ARG COMPOSER_HOME=/tmp/composer
ENV COMPOSER_HOME ${COMPOSER_HOME}

RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /simple-prepaid-card/var/cache
RUN chown -R www-data:www-data /simple-prepaid-card/var/db
RUN chown -R www-data:www-data /simple-prepaid-card/var/logs
RUN chown -R www-data:www-data /simple-prepaid-card/var/sessions

WORKDIR /simple-prepaid-card