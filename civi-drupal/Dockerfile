FROM php:7.3-apache
RUN apt-get -y update --fix-missing \
&& apt-get -y upgrade \
&& apt-get -y install --fix-missing apt-utils build-essential zip libzip-dev \
&& docker-php-ext-configure zip --with-libzip \
&& docker-php-ext-install zip \
&& apt-get -y install libmagickwand-dev --no-install-recommends \
&& apt-get -y install libsqlite3-dev libsqlite3-0 mariadb-client \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-install pdo_sqlite \
&& docker-php-ext-install mysqli \
&& apt-get -y install zlib1g-dev \
&& apt-get -y install libfreetype6-dev libjpeg62-turbo-dev \
&& docker-php-ext-install gd \
&& a2enmod rewrite headers \
&& apt-get -y install libmcrypt-dev \
&& rm -rf /var/lib/apt/lists/* \
&& pecl install mcrypt \
&& docker-php-ext-enable mcrypt

WORKDIR /var/www/html

# https://www.drupal.org/node/3060/release
ENV DRUPAL_VERSION 7.69
ENV DRUPAL_MD5 292290a2fb1f5fc919291dc3949cdf7c
ENV CIVICRM_VERSION 5.21.1
RUN set -eux; \
	curl -fSL "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz; \
	echo "${DRUPAL_MD5} *drupal.tar.gz" | md5sum -c -; \
	tar -xz --strip-components=1 -f drupal.tar.gz; \
	rm drupal.tar.gz; \
#CiviCRM preparing
	curl -fSL "https://download.civicrm.org/civicrm-${CIVICRM_VERSION}-drupal.tar.gz" -o civicrm.tar.gz; \
        tar -xzf civicrm.tar.gz -C ./sites/all/modules/; \
        rm civicrm.tar.gz; \
        chown -R www-data:www-data *; \
        chmod -R 777 *

