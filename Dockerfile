FROM rocker/tidyverse:latest

# Install Shiny server during Docker build
RUN export ADD=shiny && bash /etc/cont-init.d/add
