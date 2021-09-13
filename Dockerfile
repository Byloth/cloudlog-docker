FROM php:7.4-apache

ENV DEBIAN_FRONTEND="noninteractive"

ARG CLOUDLOG_SHA1="22e4fda171e86d4cf8b9a053281cfb853bdc435a"
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        git \
 \
 && rm -rf /var/lib/apt/lists/* \
           /tmp/*

RUN docker-php-ext-install \
        mysqli

RUN cd /tmp \
 && git clone "https://github.com/magicbug/Cloudlog.git" cloudlog \
    --branch "master" \
    --single-branch \
 \
 && cd cloudlog/ \
 && git archive "${CLOUDLOG_SHA1}" | tar xC /var/www/html \
 && chown -R www-data:www-data /var/www/html \
 && chmod -R a-w /var/www/html \
 && chmod -R ug+rw \
        /var/www/html/application/config/ \
        /var/www/html/assets/qslcard/ \
        /var/www/html/backup/ \
        /var/www/html/updates/ \
        /var/www/html/uploads/

ENV CLOUDLOG_DBHOST="127.0.0.1" \
    CLOUDLOG_DBPORT="3306" \
    CLOUDLOG_DBUSER="root" \
    CLOUDLOG_DBPASS="" \
    CLOUDLOG_DBNAME="cloudlog"

# COPY cloudlog/ /var/www/html/application/config

#
# TODO: Creare un `entrypoint.sh` per gestire la prima installazione.
#        - Deve creare le tabelle nel database o non funzionerà una sega!
#
