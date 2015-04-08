# Docker RabbitMQ Cluster
Creates a RabbitMQ cluster with 3 nodes. This can be used for extensions develpment or with the Transformers Application

### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation
a) Create an image with the name `extensions/rabbitmq`.
```
cd rabbitmq
chmod +x build.sh
sudo ./build.sh
```
b) Start the rabbitmq cluster.
```
sudo docker-compose up -d
```
### Troubleshooting
- During the step 1 of the installation, if any links return 404, please update file `Dockerfile` with the correct links. For example newer versions of the the dependant libraries might be released, so the links to the old libraries might be broken

