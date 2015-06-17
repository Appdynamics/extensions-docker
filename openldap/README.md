# Docker OpenLDAP server
Installs and configures OpenLDAP server with the following credentials

```
Bind DN: cn=admin,ou=admins,dc=appdynamics,dc=com
password: welcome
```
### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation
a) Create an image with the name `extensions/openldap`.
```
cd openldap
chmod +x build.sh
sudo ./build.sh
```
b) Start the the docker container and open ldap.
```
sudo docker-compose up
```
The setup does a port forwarding the from `host:389 -> docker_container:389`

### LDAP Configuration
```
Bind DN: cn=admin,ou=admins,dc=appdynamics,dc=com
password: welcome
```
