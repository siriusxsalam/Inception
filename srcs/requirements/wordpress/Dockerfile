FROM debian:11

RUN apt-get update && apt-get install php7.4-fpm php-mysql -y && apt-get install curl -y

COPY ./tools/wpress_script.sh /tmp
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod +x /tmp/wpress_script.sh

CMD ["/tmp/wpress_script.sh"]