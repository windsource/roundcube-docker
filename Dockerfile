FROM roundcube/roundcubemail:1.6.4-apache

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    ; \
    \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist \
        --prefer-stable \
        --update-no-dev \
        --no-interaction \
        --optimize-autoloader \
        require \
            roundcube/carddav:v4.4.6 \
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
