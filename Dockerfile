ARG BASE_IMAGE=rocker/rstudio:latest
FROM $BASE_IMAGE
# rocker/tidyverse:3.6.3
# bioconductor/bioconductor_docker:devel

LABEL org.opencontainers.image.source https://github.com/MaastrichtU-IDS/rstudio
# Rocker Dockerfile: https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/3.6.3.Dockerfile

ENV ADD=shiny
# ENV ROOT=true

## Install Shiny server
RUN /rocker_scripts/install_shiny_server.sh

## For R<4 : https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/add_shiny.sh
# COPY add_shiny.sh /etc/cont-init.d/add
# RUN bash /etc/cont-init.d/add

## Change ownership of the workspace to allow R/W of PVCs
USER root
chown -R 1000:1000 /home/rstudio
USER rstudio

## Install ZSH cause permissions issues
# USER root
# RUN apt-get update -q && \
#     apt-get install -y zsh
# RUN chown -R rstudio:rstudio /usr/local
# RUN chown -R rstudio:rstudio /run
# USER rstudio

## Install Oh My ZSH! and custom theme
# RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# RUN wget -O /home/$NB_USER/.oh-my-zsh/custom/themes/biratime.zsh-theme https://raw.github.com/vemonet/biratime/main/biratime.zsh-theme
# RUN sed -i 's/^ZSH_THEME=".*"$/ZSH_THEME="biratime"/g' ~/.zshrc
# RUN echo 'setopt NO_HUP' >> ~/.zshrc
## Set default shell to ZSH
# ENV SHELL=/bin/zsh
# USER root
# RUN chsh -s /bin/zsh 
# USER rstudio

# Expose Shiny server
EXPOSE 3838
