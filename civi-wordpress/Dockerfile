FROM php:7.3-apache
RUN apt-get -y update --fix-missing \
&& apt-get -y upgrade \
&& apt-get -y install --fix-missing apt-utils build-essential zip libzip-dev \
&& docker-php-ext-configure zip --with-libzip \
&& docker-php-ext-install zip \
&& apt-get -y install libmagickwand-dev --no-install-recommends \
&& apt-get -y install libsqlite3-dev libsqlite3-0 mariadb-client \
&& docker-php-ext-install pdo_mysql \
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

ENV WORDPRESS_VERSION 5.3.2
ENV WORDPRESS_SHA1 fded476f112dbab14e3b5acddd2bcfa550e7b01b

RUN set -eux; \
	curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
	tar -xz --strip-components=1 -f wordpress.tar.gz; \
	rm wordpress.tar.gz; \
#CiviCRM preparing
        curl -L https://download.civicrm.org/civicrm-5.21.1-wordpress.zip > civicrm-wordpress.zip; \
        unzip civicrm-wordpress.zip -d ./wp-content/plugins; \
        rm civicrm-wordpress.zip; \
	chown -R www-data:www-data *
        
