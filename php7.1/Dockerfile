FROM alpine:3.5
MAINTAINER Peter McConnell <me@petermcconnell.com>

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk upgrade && \
    apk add --update \
      php7 \
      php7-fpm && \
    rm -rf /var/cache/apk/* && \
    adduser -S -D www-data && \
    addgroup www-data && \
    adduser www-data www-data

COPY php/php.ini /etc/php7/conf.d/php-fpm.conf
COPY php/fpm.conf /etc/php7/php-fpm.conf

RUN mkdir /app
WORKDIR /app

EXPOSE 9000

CMD ["php-fpm7"]
