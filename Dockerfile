FROM rocker/verse:latest
# FROM rocker/tidyverse:3.6.3

LABEL org.opencontainers.image.source https://github.com/MaastrichtU-IDS/rstudio
# https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/3.6.3.Dockerfile

ENV ADD=shiny

# Install Shiny server during Docker build
COPY add_shiny.sh /etc/cont-init.d/add
RUN bash /etc/cont-init.d/add

USER root
RUN apt-get update -q && \
    apt-get install -y zsh
USER rstudio

# Install ZSH
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN wget -O ~/.oh-my-zsh/custom/themes/vemonet_bira.zsh-theme https://raw.githubusercontent.com/vemonet/zsh-theme-biradate/master/zsh/vemonet_bira.zsh-theme
RUN sed -i 's/robbyrussell/vemonet_bira/g' ~/.zshrc
ENV SHELL=/bin/zsh
USER root
RUN chsh -s /bin/zsh 
USER rstudio

# For Shiny server
EXPOSE 3838