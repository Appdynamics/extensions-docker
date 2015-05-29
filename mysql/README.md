# Docker MySQL server
Create a single MySQL server. This can be used for extensions develpment or with the Transformers Application
```
 - username: root
 - password: welcome
 - port: 3306
 - database name: extensions
```

### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation
a) Create an image with the name `extensions/mysql`
```
cd mysql
chmod +x build.sh
sudo ./build.sh
```
b) Start the mysql server.
```
sudo docker-compose up -d
```
Uses port forwarding, so use the port of the IP:port of the host machine to connect to mysql ports (3306)
