FROM debian:11

RUN apt-get update
RUN apt-get install mariadb-server -y

COPY ./tools/mdbscript.sh /tmp
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /tmp/mdbscript.sh

CMD ["/tmp/mdbscript.sh"]

# FROM debian:11

# RUN apt-get update
# RUN apt-get install mariadb-server -y

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/mdbscript.sh /tmp


# CMD [ "/tmp/mdbscript.sh" ]