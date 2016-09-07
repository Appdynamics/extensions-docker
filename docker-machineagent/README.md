# Docker Extension On Container
The Docker Extension is installed on a container along with the machine agent. The docker unix-socket from the is attached as a volume in the container.

### Prerequisites
1. Install `docker`
2. Install `docker-compose` 

### Installation

* Clone this git repo
* Download the `machineagent-bundle-64bit-linux.zip` to the directory `docker-machineagent`
* Download the latest `DockerMonitor.zip` to the directory `docker-machineagent`
* Copy the `config.yml` from DockerMonitor.zip to the directory `docker-machineagent` and make the necessary changes
* Copy the `socket-command.sh` from DockerMonitor.zip to the directory `docker-machineagent` and comment the existing commands. Add the following line at the bottom 
```
echo -e "GET $1 HTTP/1.0\r\n" | sudo nc -U -q 5 /var/run/docker.sock
```
* Build the container
```
cd docker-machineagent
sudo docker build -t extensions/docker-machine-agent .
```
* Edit the file `docker-compose.yml` and update `hostname` and `JAVA_OPTS`
* Start the container 
 ```
 sudo docker-compose up
 ```
* The machine agent logs will be available at `/var/log/machine-agent/machine-agent.log` in the host machine.


