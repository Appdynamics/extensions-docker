FROM centos:6

RUN yum install -y httpd
ADD fwdproxy.conf.txt /tmp/
RUN cat /tmp/fwdproxy.conf.txt >> /etc/httpd/conf/httpd.conf
ADD .htpasswd /etc/httpd/
EXPOSE 80

#CMD /bin/bash -c "service httpd start"
CMD /usr/sbin/apachectl -f /etc/httpd/conf/httpd.conf -DFOREGROUND
