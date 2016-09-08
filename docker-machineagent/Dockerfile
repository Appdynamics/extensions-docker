FROM ubuntu:14.04

RUN mkdir /machineagent
ADD machineagent-bundle-64bit-linux.zip /
ADD DockerMonitor.zip /
RUN apt-get update && apt-get -q install unzip
RUN unzip -d /machineagent/ /machineagent-bundle-64bit-linux.zip
RUN unzip -d /machineagent/monitors/ DockerMonitor.zip
ADD config.yml /machineagent/monitors/DockerMonitor
ADD socket-command.sh /machineagent/monitors/DockerMonitor
 
CMD ["/bin/bash","/machineagent/bin/machine-agent"]
