FROM centos:centos7
MAINTAINER Abey Tom <abey.tom@appdynamics.com>


RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum -y update
RUN yum -y install varnish

RUN yum -y install unzip
RUN yum -y install automake
RUN yum -y install autoconf
RUN yum -y install varnish-libs-devel
RUN yum -y install libmicrohttpd-devel
RUN yum -y install libcurl-devel
RUN yum -y install make

#RUN curl -o /etc/vagent2.zip https://codeload.github.com/varnish/vagent2/zip/4.0.1
ADD vagent2.zip /etc/
RUN unzip -d /etc/ /etc/vagent2.zip
RUN cd /etc/vagent2-4.0.1 && /etc/vagent2-4.0.1/autogen.sh \
    && ./configure \
    && make clean && make install

RUN echo admin:admin > /etc/varnish/agent_secret
ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 6081 6085
CMD ["/run.sh"]
