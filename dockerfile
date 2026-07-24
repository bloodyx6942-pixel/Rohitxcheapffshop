# PHP with SQLite3 extension
FROM php:8.2-cli

# Install SQLite3 extension and other dependencies
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    && docker-php-ext-install pdo_sqlite sqlite3 \
    && apt-get clean

# Set working directory
WORKDIR /var/www/html

# Copy your PHP file and SQLite DB
COPY index.php .
COPY venomx.db .

# Expose port (PHP built-in server uses 8000 by default)
EXPOSE 8000

# Start PHP built-in server
CMD ["php", "-S", "0.0.0.0:8000"]