# Solr Container
Installs a solr container with 3 cores

### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation
a) Create an image with the name `extensions/solr`.
```
cd solr
sudo ./build.sh
```
b) Start the the docker container and httpd server.
```
sudo docker-compose up -d
```
The setup does a port forwarding the from `host:8983 -> docker_container:8983`
