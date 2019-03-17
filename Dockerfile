FROM php:7.3-apache

RUN set -ex; \
	apt-get update; \
    apt-get install -y --no-install-recommends \
        git \
        zip \
        unzip \
        sqlite3 \
        libzip-dev \
        libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
        libicu-dev \
		libldap2-dev \
		libpq-dev \
		libsqlite3-dev \
        zlib1g-dev; \
    debMultiarch="$(dpkg-architecture --query DEB_BUILD_MULTIARCH)"; \
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-configure ldap --with-libdir="lib/$debMultiarch"; \
	docker-php-ext-install \
		exif \
		gd \
        # imagick \
		intl \
		ldap \
		pdo_mysql \
		pdo_pgsql \
		pdo_sqlite \
        zip
RUN curl -L https://github.com/roundcube/roundcubemail/releases/download/1.4-rc1/roundcubemail-1.4-rc1-complete.tar.gz | \
    tar xz --strip-components=1; \    
    # Install composer
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');"

COPY php.ini /usr/local/etc/php/conf.d/roundcube-defaults.ini
COPY config.inc.php config/

# Install dependencies
# Plugin ident_switch requires an existing db during installtion
COPY composer.json .     
RUN mkdir db; \
    sqlite3 db/sqlite.db < SQL/sqlite.initial.sql; \
    php composer.phar update --no-dev; \
    php composer.phar install --no-dev

# enable mod_rewrite
RUN a2enmod rewrite

COPY php.ini /usr/local/etc/php/conf.d/roundcube-defaults.ini
COPY config.inc.php config/

RUN chown -R www-data:www-data .

