################################################################################
# Base image
################################################################################

FROM nginx

################################################################################
# Build instructions
################################################################################

# Remove default nginx configs.
RUN rm -f /etc/nginx/conf.d/*

# Install packages
RUN apt-get update && apt-get install -y \
  supervisor \
  curl \
  git \
  php5-dev \
  php5-curl \
  php5-fpm \
  php5-mysql \
  php5-mcrypt \
  php5-xdebug \
  gcc \
  libpcre3-dev

# Install php-redis
RUN git clone git://github.com/nicolasff/phpredis.git
WORKDIR phpredis
RUN phpize \
  && ./configure \
  && make \
  && make install
RUN mv modules/redis.so {php-config–extension-dir}

# Install PhalconPHP
RUN git clone --depth=1 git://github.com/phalcon/cphalcon.git
RUN cd cphalcon/build && ./install

# Install PHP Mongo
RUN pecl install mongo

# Ensure that PHP5 FPM is run as root.
RUN sed -i "s/user = www-data/user = root/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/group = www-data/group = root/" /etc/php5/fpm/pool.d/www.conf

# Add configuration files
COPY conf/nginx.conf /etc/nginx/
COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY conf/php.ini /etc/php5/fpm/conf.d/40-custom.ini

################################################################################
# Volumes
################################################################################

VOLUME ["/var/www", "/etc/nginx/conf.d"]

################################################################################
# Ports
################################################################################

EXPOSE 80 443 9000

################################################################################
# Entrypoint
################################################################################

ENTRYPOINT ["/usr/bin/supervisord"]
