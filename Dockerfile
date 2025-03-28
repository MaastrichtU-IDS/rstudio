ARG BASE_IMAGE=rocker/rstudio:latest
FROM $BASE_IMAGE

LABEL org.opencontainers.image.source https://github.com/MaastrichtU-IDS/rstudio

## Install Shiny server
RUN /rocker_scripts/install_shiny_server.sh

# Expose Shiny server
EXPOSE 3838