FROM php:8.0.0rc1-fpm

RUN apt-get update
RUN apt-get install -y gettext

RUN docker-php-ext-install mysqli 
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-configure gettext 
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini

WORKDIR /var/www