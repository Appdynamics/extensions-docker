## Couchbase Docker Container
This uses the image from "couchbase/server" and sets up the couchbase enterprise edition. 

### Prerequisites
1. Install `docker`
2. Install `docker-compose`

### Installation

##### a) Start the the couchbase container
```
sudo docker-compose up -d
```
The setup does a port forwarding the from `host:8091 -> docker_container:8091`

##### b) Setup Couchbase
Navigate to [http://docker-host:8091](http://docker-host:8091). Here you need to manually setup the buckets and ram quota.
