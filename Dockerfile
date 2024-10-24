FROM roundcube/roundcubemail:1.6.9-apache

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git

RUN COMPOSER_ALLOW_SUPERUSER=1 composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist \
        --prefer-stable \
        --update-no-dev \
        --no-interaction \
        --optimize-autoloader \
        require \
            roundcube/carddav:v5.1.0 \
            kitist/html5_notifier:dev-master \
        ; 

ENV ROUNDCUBEMAIL_PLUGINS=archive,zipdownload,carddav,html5_notifier
ENV ROUNDCUBEMAIL_DEFAULT_HOST=ssl://imap.gmx.net
ENV ROUNDCUBEMAIL_DEFAULT_PORT=993
ENV ROUNDCUBEMAIL_SMTP_SERVER=ssl://mail.gmx.net
ENV ROUNDCUBEMAIL_SMTP_PORT=465
ENV ROUNDCUBEMAIL_UPLOAD_MAX_FILESIZE=50M
ENV ROUNDCUBEMAIL_SKIN=elastic
ENV ROUNDCUBEMAIL_ASPELL_DICTS=de,en
