FROM debian:buster

RUN	apt update -y && apt upgrade -y && \
	apt install nginx && \
	mkdir /etc/nginx/ssl

COPY nginx.conf /etc/nginx/

COPY ssl/localhost.crt /etc/nginx/ssl

COPY ssl/localhost.decrypted.key /etc/nginx/ssl

CMD [ "nginx", "-g", "daemon off;" ]