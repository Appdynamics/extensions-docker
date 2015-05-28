FROM ubuntu:14.10
MAINTAINER abey.tom@appdynamics.com

RUN apt-get update \
 && apt-get install -y mysql-server \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/apt/lists/*

ADD startmysql.sh /start
RUN chmod 755 /start

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/start"]
