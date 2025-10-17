FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y \
    apache2 \
    php8.3 \
    php8.3-cli \
    php8.3-mysql \
    php8.3-opcache \
    libapache2-mod-php8.3 \
    mysql-client \
    wget curl git nano \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN a2enmod rewrite

EXPOSE 80

RUN echo "<?php phpinfo(); ?>" > index.php

CMD ["apachectl", "-D", "FOREGROUND"]