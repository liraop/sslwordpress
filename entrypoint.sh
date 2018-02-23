#!/bin/bash

#Wait MySql is Ready!
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" -uroot -p"$WORDPRESS_DB_PASSWORD" --silent; do
    sleep 1
done


#Create wordpress Database
#mysql -h"$WORDPRESS_DB_HOST" -u root -p"$WORDPRESS_DB_PASSWORD" --execute="CREATE DATABASE wordpress"

#Insert base sql
mysql -h"$WORDPRESS_DB_HOST" -uroot -p"$WORDPRESS_DB_PASSWORD" "$WORDPRESS_DB_NAME" < /tmp/dump.sql

#remove dump from image
rm /tmp/dump.sql

#Run apache
apache2-foreground
