FROM php:5.6

MAINTAINER "Diego Marangoni" <https://github.com/diegomarangoni>

RUN buildDeps=" \
		libssl-dev \
		zlib1g-dev \
		libicu-dev \
		git \
		nodejs \
		npm \
	" \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
    && { yes 'no' | pecl install mongo; } \
    && { yes '' | pecl install apcu-beta; } \
    && docker-php-ext-install intl zip pdo_mysql \
    && docker-php-ext-enable mongo apcu opcache \
    && echo 'date.timezone="UTC"' > /usr/local/etc/php/conf.d/date-timezone.ini \
	&& npm install -g less
