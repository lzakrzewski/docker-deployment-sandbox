FROM php:7.0-fpm

RUN apt-get update && apt-get install -y software-properties-common make wget
# RUN apt-get update && apt-get install -y php7.0 php7.0-fpm php7.0-mbstring php7.0-xml php7.0-sqlite php7.0-zip

RUN wget -O /usr/bin/composer https://getcomposer.org/download/1.2.0/composer.phar
RUN chmod +x /usr/bin/composer

ARG COMPOSER_HOME=/tmp/composer
ENV COMPOSER_HOME ${COMPOSER_HOME}

WORKDIR /simple-prepaid-card
# RUN /etc/init.d/php7.0-fpm start

#RUN service php7.0-fpm start


#EXPOSE 9000

#ENTRYPOINT ["bash", "-c", "service php7.0-fpm start && tail -f /dev/null"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT /usr/sbin/php-fpm7.0 --nodaemonize



