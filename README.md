docker.rshinyapp
==========================

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/rsunau/dockershiny)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/rsunau/dockershiny)

The repo is to dockerize a R shinyApp and make deployment easier by publish the image to DockerHub.

## How could I run the app in a container?

1. Download and install [Docker](https://www.docker.com/products/docker-desktop)

2. Pull docker image from DockerHub and run a container

```
docker pull rsunau/dockershiny

docker run --rm -d -p 80:3838 rsunau/dockershiny

```

3. You can run the app by visiting http://localhost/dockershiny/

## Build a docker image and publish it

```

docker build -t rsunau/dockershiny:tagname .

docker push rsunau/dockershiny:tagname

```


## R Docker Images 

The rocker-org built a few images for the rstudio and shiny server. e.g. [Docker Image rocker/shiny](https://github.com/rocker-org/shiny)

* Image with Rstudio and Tidyverse package 

```
docker run --rm -e PASSWORD=xxx -p 8787:8787 rocker/verse
```

* Image with Rstudio and shiny server

```
docker run -d -p 3838:3838 -p 8787:8787 -e ADD=shiny -e PASSWORD=yourpasswordhere rocker/rstudio
```

* Image with the shiny server and Tidyverse package

```
docker run --rm  -p 3838:3838 rocker/shiny-verse
```


## Docker Commands
[Docker CLIs](https://docs.docker.com/engine/reference/commandline/docker/)

1. List containers

```
docker ps
```

2. Run a command in a running container 

```
docker exec -it <container name> /bin/bash
```
  
3. Run a new container

```
docker run --rm -d -p 3838:3838 rocker/shiny-verse
```
4. Copy local files to/from a running container

```
docker cp foo.txt <container name>:/foo.txt
docker cp src/. <container name>:/target
docker cp <container name>:/src/. target
```

5. Stop a running container

```
docker stop <container>
```

## Run a docker container on AWS

1. create a new Security group on AWS and open port 80 and 8787
2. Launch a EC2 instance
3. install docker
```
sudo yum update
sudo yum install docker
sudo service docker start
```

4. run a docker image with rstudio and shiny
```
sudo docker run -d -p 80:3838 -p 8787:8787 -e ADD=shiny -e PASSWORD=xxx rocker/rstudio

```

## A very useful tutorial on R and Docker 
https://ropenscilabs.github.io/r-docker-tutorial/

## TODO
1. To run docker on AWS
