FROM java:8u111-jre

RUN apt-get update
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz | tar -xz -C /usr/local
ADD spark.sh /usr/bin/spark-start
RUN  ln -s /usr/local/spark* /usr/local/spark && chmod +x /usr/bin/spark-start


CMD /usr/bin/spark-start