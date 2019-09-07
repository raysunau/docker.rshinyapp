# docker.rshinyapp
Dockerize a shinyApp 

### very useful tutorial on R and Docker 
https://ropenscilabs.github.io/r-docker-tutorial/

### Docker Images 

1. Image with rstudio and tidyverse 

> docker run --rm -e PASSWORD=321 -p 8787:8787 rocker/verse


### Commands

1. List running containers

> docker container ps

2. SSH into a running container 
> docker exec -it <container name> /bin/bash
