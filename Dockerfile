FROM rocker/tidyverse:latest

LABEL org.opencontainers.image.source https://github.com/MaastrichtU-IDS/rstudio
# https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/3.6.3.Dockerfile

ENV ADD=shiny
# Install Shiny server during Docker build
RUN bash /etc/cont-init.d/add

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