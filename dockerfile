FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    && docker-php-ext-install pdo_sqlite sqlite3 \
    && apt-get clean

WORKDIR /var/www/html

COPY index.php .

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000"]