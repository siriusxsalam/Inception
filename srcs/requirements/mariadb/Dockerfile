FROM debian:11

RUN apt-get update && apt-get install mariadb-server -y && apt-get install mariadb-client -y

COPY ./tools/mdbscript.sh /tmp

RUN chmod +x /tmp/mdbscript.sh

ENTRYPOINT ["/tmp/mdbscript.sh"]