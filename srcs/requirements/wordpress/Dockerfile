FROM debian:11

RUN apt-get update && apt-get install -y php-fpm php-mysql && apt-get install curl -y
RUN apt install wget
COPY ./tools/wpress_script.sh /tmp
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

RUN chmod 777 /tmp/wpress_script.sh

RUN mkdir /run/php

CMD [ "/tmp/wpress_script.sh" ]
# CMD ["tail -F", "/dev/null"]