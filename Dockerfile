FROM php:8.3.3-fpm

RUN apt-get update -y && apt-get install -y nginx \
        libzip-dev \
        unzip \
        && docker-php-ext-install zip pdo_mysql

# Copy the application files to the container

COPY docker/default.conf /etc/nginx/sites-enabled/default
COPY docker/entrypoint.sh /etc/entrypoint.sh

RUN chmod +x /etc/entrypoint.sh

## Set the working directory
WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/etc/entrypoint.sh"]
