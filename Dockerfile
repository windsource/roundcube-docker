FROM roundcube/roundcubemail:1.5-rc-apache

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    ; \
    \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer; \
    mv /usr/src/roundcubemail/composer.json-dist /usr/src/roundcubemail/composer.json; \
    \
    composer \
    --working-dir=/usr/src/roundcubemail/ \
    --prefer-dist --prefer-stable \
    --no-update --no-interaction \
    --optimize-autoloader --apcu-autoloader \
    require \
    roundcube/carddav:v4.1.1 \
    kitist/html5_notifier:dev-master \
    ; \
    composer \
    --working-dir=/usr/src/roundcubemail/ \
    --prefer-dist --no-dev \
    --no-interaction \
    --optimize-autoloader --apcu-autoloader \
    update;

ENV ROUNDCUBEMAIL_PLUGINS=archive,zipdownload,carddav,html5_notifier
ENV ROUNDCUBEMAIL_DEFAULT_HOST=ssl://imap.gmx.net
ENV ROUNDCUBEMAIL_DEFAULT_PORT=993
ENV ROUNDCUBEMAIL_SMTP_SERVER=ssl://mail.gmx.net
ENV ROUNDCUBEMAIL_SMTP_PORT=465
ENV ROUNDCUBEMAIL_UPLOAD_MAX_FILESIZE=50M
