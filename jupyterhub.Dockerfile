ARG BASE_IMAGE=rocker/binder:latest
# ARG BASE_IMAGE=rocker/binder:4.1.2
FROM $BASE_IMAGE

LABEL org.opencontainers.image.source https://github.com/MaastrichtU-IDS/rstudio

USER ${NB_USER}

# Restricting the number of thread allocated to OpenBLAS can speed up computations using OpenBLAS 
# Leave empty for default, e.g. 64 on DSRI
ENV PATH=$PATH:/opt/pyenv/bin \
    OPENBLAS_NUM_THREADS=1


# Install Conda and Mamba
USER root
ENV CONDA_DIR=${CONDA_DIR:-/opt/conda} \
    SHELL=/bin/bash \
    LANG=${LANG:-en_US.UTF-8} \
    LANGUAGE=${LANGUAGE:-en_US.UTF-8}
ENV PATH="${CONDA_DIR}/bin:${PATH}"

RUN export download_url=$(curl -s https://api.github.com/repos/conda-forge/miniforge/releases/latest | grep browser_download_url | grep -P "Mambaforge-\d+((\.|-)\d+)*-Linux-x86_64.sh" | grep -v sha256 | cut -d '"' -f 4) && \
    echo "Downloading latest miniforge from $download_url" && \
    curl -Lf -o miniforge.sh $download_url && \
    # curl -Lf "https://github.com/conda-forge/miniforge/releases/download/${miniforge_version}/${miniforge_installer}" -o miniforge.sh
    /bin/bash "miniforge.sh" -f -b -p "${CONDA_DIR}" && \
    rm "miniforge.sh" && \
    mamba config --system --set auto_update_conda false && \
    mamba config --system --set show_channel_urls true && \
    chown -R ${NB_USER}:staff /opt/conda 

USER ${NB_USER}

## Declares build arguments
# ARG NB_USER
# ARG NB_UID

# COPY --chown=${NB_USER} . ${HOME}
# ENV DEBIAN_FRONTEND=noninteractive
# USER root
# RUN echo "Checking for 'apt.txt'..." \
#         ; if test -f "apt.txt" ; then \
#         apt-get update --fix-missing > /dev/null\
#         && xargs -a apt.txt apt-get install --yes \
#         && apt-get clean > /dev/null \
#         && rm -rf /var/lib/apt/lists/* \
#         ; fi
# USER ${NB_USER}

# ## Run an install.R script, if it exists.
# RUN if [ -f install.R ]; then R --quiet -f install.R; fi

