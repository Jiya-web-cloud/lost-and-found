# Use an official PHP image with Apache
FROM php:8.2-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy your application files into the container
COPY . /var/www/html/

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set proper ownership (optional)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
