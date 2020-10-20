FROM ubuntu:20.04

# Environment Variables
ENV STAGE development

RUN apt-get update && apt-get install -y curl wget software-properties-common vim
RUN apt-get install -y gcc make g++ python3-distutils build-essential libssl-dev openssl sqlite3
RUN apt-get install -y php php-pear php-dev php-cli unzip php-sqlite3 php-mbstring php-xml php-bcmath php-zip php-json 

# Create application directory
WORKDIR /usr/src/app

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php /usr/src/app/composer-setup.php

COPY . .

RUN mkdir .vendor
RUN php composer.phar require "laravel/installer:4.0.3"
RUN touch database/database.sqlite
RUN cp .env.docker .env
RUN php artisan migrate:install
RUN php artisan migrate
RUN php artisan db:seed
RUN php artisan key:generate

CMD php artisan serve --host=0.0.0.0 --port=3000
EXPOSE 3000

