FROM debian:buster

EXPOSE 3306

RUN	apt update -y && apt upgrade -y && \
	apt install mariadb-server

COPY tools/entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]