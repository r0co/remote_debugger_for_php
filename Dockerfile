FROM php:7.1-apache

COPY conf/sources.list /etc/apt/sources.list
COPY conf/php.ini /usr/local/etc/php/php.ini

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN apt-get update && apt-get install vim -y
RUN install-php-extensions xdebug mysqli gd mbstring

COPY app/ /var/www/html/