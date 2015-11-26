FROM ubuntu:latest
MAINTAINER Abey Tom <abey.tom@appdynamics.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update 
RUN apt-get install -y mongodb-org=3.0.3 mongodb-org-server=3.0.3 mongodb-org-shell=3.0.3 mongodb-org-mongos=3.0.3 mongodb-org-tools=3.0.3
RUN mkdir -p /data/db
EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod"]

