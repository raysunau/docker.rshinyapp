# get shiny serves plus tidyverse packages image
FROM rocker/shiny-verse:latest

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev

# Clean cache
RUN rm -rf /var/lib/apt/lists/*

# install R packages required 
# (change it dependeing on the packages you need)
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('andrewsali/shinycssloaders')"

# Install R packages
RUN install2.r --error \
    mlr \
    jsonlite \
    tseries
    
# copy the app to the image
COPY docker.rshinyapp.Rproj /srv/shiny-server/dockershiny/
COPY *.R /srv/shiny-server/dockershiny/
# COPY R /srv/shiny-server/dockershiny/R
# COPY data /srv/shiny-server/dockershiny/data

# select port
EXPOSE 3838

# allow permission
RUN sudo chown -R shiny:shiny /srv/shiny-server

# run app
CMD ["/usr/bin/shiny-server"]
