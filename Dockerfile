FROM reflet/docker-php7.2

# add workspace.
ARG APP_DIR="/var/www/www.example.com"
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# add applicaiton script.
COPY --chown=www-data:www-data src $APP_DIR
RUN cp .env.example .env && \
    composer install && \
    php artisan key:generate

# add command.
COPY --chown=www-data:www-data run.sh /usr/local/bin/run.sh
RUN chmod u+x /usr/local/bin/run.sh

CMD ["/usr/local/bin/run.sh"]
