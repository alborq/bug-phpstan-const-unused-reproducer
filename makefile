.DEFAULT_GOAL := help

.PHONY: help ### liste des fonctionnalité du Makefile
help:
		@grep '##' makefile \
		| grep -v 'grep\|sed' \
		| sed 's/^\.PHONY: \(.*\) ##[\s|\S]*\(.*\)/\1:\t\2/' \
		| sed 's/\(^##\)//' \
		| sed 's/\(##\)/\t/' \
		| expand -t31

.PHONY: start ## Démarrage du container
shell:
	docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine composer install
	docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine sh

bug:
	docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine composer install
	docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine vendor/bin/phpstan.phar analyse -c phpstan-bug.neon

nobug:
	docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine composer install
	docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine vendor/bin/phpstan.phar analyse -c phpstan-nobug.neon
