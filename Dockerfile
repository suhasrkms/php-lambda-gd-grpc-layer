FROM bref/php-83-fpm-dev:latest

RUN yum install -y libpng libpng-devel freetype freetype-devel libjpeg libjpeg-devel autoconf gcc gcc-c++ make \
    && pecl install grpc \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && echo 'extension=gd.so' > /opt/bref/etc/php/conf.d/gd.ini \
    && echo 'extension=grpc.so' > /opt/bref/etc/php/conf.d/grpc.ini
