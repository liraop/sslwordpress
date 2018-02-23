FROM wordpress:latest

RUN apt-get update && apt-get install -y \
    mysql-client \
    zip \
    vim \
&& rm -rf /var/lib/apt/lists/*

#copy wordpress app
ADD ./wp-app /var/www/html

# copy database
COPY ./database/dump.sql /tmp/

#copy cert and key
COPY ./ssl/*.pem /etc/ssl/certs/
COPY ./ssl/*.key /etc/ssl/private/

RUN chown -R www-data:www-data /var/www/*

ADD ./apache/000-default-ssl.conf /etc/apache2/sites-enabled/

RUN a2enmod rewrite
RUN a2enmod ssl

COPY ./entrypoint.sh /
CMD [ "bash", "/entrypoint.sh"]
