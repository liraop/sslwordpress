# SSL Wordpress
- forked from [victorhundo](https://github.com/victorhundo/wordpress)

Image created to migrate running Wordpress sites on a host to containers using official Wordpress and MySQL images from DockerHub.


## What it needs

1. Copy your running wordpress folder (e.g. /var/www/html/site);
2. MySQL dump of the site's database;
3. Pairs of certificates and keys

## Getting to work

1. Paste your wordpress site got from last section into `wp-app` folder;
2. Paste your certificates and keys into `ssl` folder;
3. Add the certificates/keys lines into [000-default-ssl.conf](./apache/000-default-ssl.conf) file at `apache` folder;
4. Paste your database dump into `database` folder
5. Set and run your `docker-compose.yml` file. A [sample](./docker-compose.yml) is given.

Check out [Dockerfile](./Dockerfile) to see how it works.


Any improvement or issue report is welcome.
