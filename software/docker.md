# Notes About Docker

First you must almost always use `sudo` for some weird reasons based on how I installed with apt-get?, not sure why and not a fan. Mentally add it to all the commands listed below.

### Stopping a Container

Run `docker ps` and get a list of the containers running find the id you want to kill and copy it.  
Then run `docker kill <ID>`

### Checking installed containers / sizes
`docker images`

### Build a Docker Container

The docker file in Rally of Rockets has some extra notes on the dockerfile, not many, good luck.  
`docker build --tag tyrebytes/<CONTAINER_LABEL> -f dockerfile ../`

### Run / Test the container

Run the docker file and let it make port 5000 on the machine act as 9999 inside the container. (or vice versa). If a game-server in the container listened on port A the docker container listens on port B and send that to the game as it would expect.  
`docker run -p 5000:9999 tyrebytes/rally-of-rockets`
