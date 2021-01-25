FROM rocker/tidyverse:latest

LABEL org.opencontainers.image.source https://github.com/MaastrichtU-IDS/rstudio

# Install Shiny server during Docker build
RUN export ADD=shiny && bash /etc/cont-init.d/add
