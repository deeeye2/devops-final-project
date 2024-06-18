# Use the official PHP image as a base image
FROM php:7.4-apache

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html/

# Set the appropriate permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Add a custom Apache configuration to ensure DirectoryIndex and permissions are correct
RUN echo "<Directory /var/www/html>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride None\n\
    Require all granted\n\
</Directory>\n\
DirectoryIndex index.php index.html" > /etc/apache2/conf-available/custom-config.conf

# Enable the custom Apache configuration
RUN a2enconf custom-config

# Expose port 80
EXPOSE 80

# Start the Apache service ..
CMD ["apache2-foreground"]

