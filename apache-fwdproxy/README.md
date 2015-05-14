# Docker Apache httpd Forward Proxy
Installs and configures an httpd server which works as an authenticated forward proxy. The proxy credentials are
username: `proxyuser`
password: `proxypassword`

### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation
a) Create an image with the name `extensions/apache-fwdproxy`.
```
cd apache-fwdproxy
chmod +x build.sh
sudo ./build.sh
```
b) Start the the docker container and httpd server.
```
sudo docker-compose up
```
