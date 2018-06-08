FROM httpd:2.4

ARG USER="www-data"
ARG UID="1000"
ARG GROUP="www-data"
ARG GID="1000"
ARG DOCUMENT_DIR="/var/www/"
ARG WORKSPACE="/usr/local/apache2/"

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
RUN apt-get -y install git vim less

# document directory
RUN mkdir $DOCUMENT_DIR && chmod 705 $DOCUMENT_DIR

# virtualhost
RUN mkdir -p /usr/local/apache2/conf.d/virtualhost/ && \
    { \
      echo ''; \
      echo 'LoadModule rewrite_module modules/mod_rewrite.so'; \
      echo 'LoadModule proxy_module modules/mod_proxy.so'; \
      echo 'LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so'; \
      echo 'LoadModule ssl_module modules/mod_ssl.so'; \
      echo 'LoadModule socache_shmcb_module modules/mod_socache_shmcb.so'; \
      echo ''; \
      echo 'DirectoryIndex index.php index.html'; \
      echo '<FilesMatch \.php$>'; \
      echo '    CGIPassAuth On'; \
      echo '    SetHandler "proxy:fcgi://php:9000"'; \
      echo '</FilesMatch>'; \
      echo ''; \
      echo '# Default Virtualhost Configuration'; \
      echo '<VirtualHost *:80>'; \
      echo '  DocumentRoot /usr/local/apache2/htdocs/'; \
      echo '  ServerName 127.0.0.1'; \
      echo '  <Directory "/usr/local/apache2/htdocs/">'; \
      echo '    DirectoryIndex index.html'; \
      echo '    Options FollowSymLinks'; \
      echo '    AllowOverride None'; \
      echo '    Order allow,deny'; \
      echo '    Allow from all'; \
      echo '  </Directory>'; \
      echo '</VirtualHost>'; \
      echo ''; \
      echo '# SSL'; \
      echo 'Include conf/extra/httpd-ssl.conf'; \
      echo ''; \
      echo '# Virtualhost Configuration'; \
      echo '# Load config files in the "/usr/local/apache2/conf.d/virtualhost/" directory, if any.'; \
      echo 'IncludeOptional conf.d/virtualhost/*.conf'; \
    } >> /usr/local/apache2/conf/httpd.conf

# default ssl file
COPY ./server.key /usr/local/apache2/conf/server.key
COPY ./server.crt /usr/local/apache2/conf/server.crt
RUN sed -i -e "s/www.example.com/127.0.0.1/g" /usr/local/apache2/conf/extra/httpd-ssl.conf

# user setting
WORKDIR $WORKSPACE
RUN usermod -u $UID $USER && groupmod -g $GID $GROUP

