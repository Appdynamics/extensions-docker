
Machine Agent(v4.4.2.742) with EC2 Tag Extension on container
The EC2 Tag Extension is installed on a container along with the machine agent.

### Prerequisites
1. Attach appropriate IAM role to the EC2 instance that can read and write EC2 tags. 
1. Install `docker` on the EC2 instance.
2. Install `docker-compose` on the EC2 instance.

### Installation
* Clone this git repo on the EC2 instance the needs to be monitored.
* Download the `machineagent-bundle-64bit-linux.zip` to the directory `docker-machineagent`.
* Unzip the 'machineagent-bundle-64bit-linux.zip'.
* Download the AWS EC2 Tag Extension and get the `EC2TagExtension` folder after unzipping and place it in the `monitors` folder of the unzipped machine agent.
* Zip the machineagent to machineagent.zip and place it in `docker-machine-agent-with-EC2TagExtension` folder. 
* Fill the controller credentials in .env file (to which the machine agent has to report).

### Build the container

```
cd docker-machine-agent-with-EC2TagExtension

sudo docker-compose up

```
The above will build the image and start the container. 

