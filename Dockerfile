# Use the official PHP image as a base image
FROM php:7.4-apache

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html/

# Install any necessary dependencies, if any
# RUN docker-php-ext-install mysqli ....

# Expose port 80
EXPOSE 80

# Start the Apache service
CMD ["apache2-foreground"]

