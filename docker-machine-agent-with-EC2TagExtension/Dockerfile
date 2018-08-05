# Sample Dockerfile for the AppDynamics Standalone Machine Agent with EC2 Tag Extension.
FROM java:8

# Install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y unzip && \
    apt-get clean

# Install AppDynamics Machine Agent
ENV MACHINE_AGENT_HOME /opt/appdynamics/machine-agent/
ADD machine-agent.zip /tmp/
RUN mkdir -p /opt/appdynamics && \
    unzip -oq /tmp/machine-agent.zip -d /opt/appdynamics/ && \
    rm /tmp/machine-agent.zip 

# Include start script to configure and start MA at runtime
ADD start-appdynamics ${MACHINE_AGENT_HOME}
RUN chmod 744 ${MACHINE_AGENT_HOME}start-appdynamics

# Configure and Run AppDynamics Machine Agent
CMD "${MACHINE_AGENT_HOME}start-appdynamics"
