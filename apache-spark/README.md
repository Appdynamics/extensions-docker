# Spark Cluster with Docker
Installs a spark standalone cluster with 1 master node and 3 slave nodes

## Prerequisites
1. Install `docker`
2. Install `docker-compose`

## Installation
#### Start the cluster
```
docker compose up -d --build
```
#### Port Forwarding
The following ports from the docker host machine is mapped to the container. The spark UI can be access with this.

http://docker-host:8585 -> master:8080
http://docker-host:8586 -> worker1:8081
http://docker-host:8587 -> worker2:8081
http://docker-host:8588 -> worker3:8081

## Run a job
Jobs can be manually executed on demand.
#### 1) List the containers 
`docker ps`

#### 2) login to the master container
`docker exec -it <container-id> bash`

#### 3) Run the SparkPi from the samples
```
/usr/local/spark/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://spark.master:7077 \
  --total-executor-cores 4 \
  /usr/local/spark/examples/jars/spark-examples_2.11-2.0.2.jar \
  100
```
