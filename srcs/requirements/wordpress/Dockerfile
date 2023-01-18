FROM debian:buster

EXPOSE 9000

RUN	apt update -y && apt upgrade -y && \
	apt install -y	php7.4-fpm \
					php7.4-mysql \ 
					mariadb-client

COPY www.conf /etc/php/7.4/fpm/pool.d/

ADD https://wordpress.org/wordpress-6.1.1.tar.gz /tmp/

RUN tar -zxf /tmp/wordpress-* rm && \
	-rf wordpress-*.tar.gz && \
    mkdir -p /var/www/html/ && \
    mv ./wordpress/* /var/www/html/ && \
    rm -rf ./wordpress/

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /tmp/

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY tools/entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]