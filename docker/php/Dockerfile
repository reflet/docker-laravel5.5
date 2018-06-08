FROM php:7.2-fpm

ARG USER="www-data"
ARG UID="1000"
ARG GROUP="www-data"
ARG GID="1000"
ARG WORKSPACE="/var/www/"

# system update
RUN apt-get -y update

# locale
RUN apt-get -y install locales && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# timezone (Asia/Tokyo)
ENV TZ JST-9

# etc
ENV TERM xterm

# tools
RUN apt-get install -y git vim less

# php options
RUN docker-php-ext-install mysqli pdo_mysql

# php.ini
COPY php.ini /usr/local/etc/php/php.ini

# composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# user setting
WORKDIR $WORKSPACE
RUN usermod -u $UID $USER && groupmod -g $GID $GROUP

