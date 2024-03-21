FROM debian:11

RUN apt-get update && apt-get install nginx -y && apt install openssl -y

COPY /conf/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/script.sh /tmp

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]