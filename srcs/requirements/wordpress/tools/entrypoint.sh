#! /bin/bash

set -e

system php-fpm start

wp config create --force --path=/var/www/html/ \
	--dbhost=$DB_HOST \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$PW

chown -R www-data:www-data /var/www/html/

wp core install --path=/var/www/html/ \
	--title=$WP_TITLE \
	--url=$WP_URL \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$PW \
	--admin_email=$WP_ADMIN_MAIL

wp user create --path=/var/www/html/ \
	$WP_USER \
	$WP_USER_MAIL \
	--user_pass=$PW \
	--role=author

service php7.3-fpm stop

/etc/init.d/php7.4-fpm