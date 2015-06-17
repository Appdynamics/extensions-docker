# Varnish Server with Varnish Agent
Installs Varnish server and build/configures Varnish Agent.

### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation
a) Create an image with the name `extensions/varnish_with_vagent2`.
```
cd varnish
chmod +x build.sh
sudo ./build.sh
```
b) Start the the docker container and varnish server + agent.
```
sudo docker-compose up
```
The setup does port forwarding the from 
 - `host:6081 -> docker_container:6081` : Varnish server
 - `host:6085 -> docker_container:6085` : Varnish agent [`http://docker-host:6085/stats`]

The credentials for varnish agent is `admin:admin`.
