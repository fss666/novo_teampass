FROM php:7.4-fpm-alpine
LABEL author="felipess19@protonmail.com"
 
RUN apk update --no-cache \
&& apk add \
icu-dev \
oniguruma-dev \
tzdata \
openldap-dev

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
 
RUN docker-php-ext-install intl

RUN docker-php-ext-install pcntl

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install mbstring

RUN docker-php-ext-configure bcmath
RUN docker-php-ext-install bcmath

RUN docker-php-ext-configure ldap
RUN docker-php-ext-install ldap

RUN docker-php-ext-install iconv

RUN apk add jpeg-dev zlib-dev libpng-dev freetype-dev libjpeg-turbo-dev
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ 
RUN docker-php-ext-install gd

RUN docker-php-ext-install mysqli

RUN apk del openldap-dev
 
RUN rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# COPY config/php/docker-vars.ini /usr/local/etc/php/conf.d/docker-vars.ini

CMD ["php-fpm"]