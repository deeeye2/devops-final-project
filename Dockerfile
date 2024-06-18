# Use the devopsedu/webapp image as a base image
FROM devopsedu/webapp

# Remove the default index.html to avoid conflict
RUN rm -f /var/www/html/index.html

# Copy the PHP website files to the Apache document root
COPY website/ /var/www/html/

# Set the appropriate permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Ensure Apache is started in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

