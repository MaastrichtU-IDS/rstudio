**RStudio** image with Shiny server based on the popular [Rocker RStudio image](https://github.com/rocker-org/rocker-versioned)

Hosted on GitHub Container Registry ([ghcr.io](https://ghcr.io)) to avoid DockerHub pull limitations, and easily deploy on clusters (such as Kubernetes).

## 🏷️ Automatically updated

[![Publish Docker image](https://github.com/MaastrichtU-IDS/rstudio/workflows/Publish%20Docker%20image/badge.svg)](https://github.com/MaastrichtU-IDS/rstudio/actions) [![Publish RStudio Docker image for JupyterHub](https://github.com/MaastrichtU-IDS/rstudio/actions/workflows/publish-docker-jupyterhub.yml/badge.svg)](https://github.com/MaastrichtU-IDS/rstudio/actions/workflows/publish-docker-jupyterhub.yml)

The image on [ghcr.io](https://ghcr.io) is automatically updated every week (Monday at 3:00 GMT+1) by a GitHub Actions workflow to match the `latest` tag of [rocker/verse](https://hub.docker.com/r/rocker/verse)

## 🐳 Run

Start RStudio on http://localhost:8787 with Shiny server on http://localhost:3838

```bash
docker run -it -p 8787:8787 -e PASSWORD=password -e ROOT=true ghcr.io/maastrichtu-ids/rstudio:latest
```

In the container:

* Workspace path is `/home/rstudio`
* User is `rstudio` with `sudo` privileges

Environment variables:

* `-e PASSWORD=password` : set password
* `-e ROOT=true` : enable `sudo` 

## 📦️ Build

You can define the base image used to build RStudio with the build argument `BASE_IMAGE`, for example here with `bioconductor/bioconductor_docker:devel`

```bash
docker build -t ghcr.io/maastrichtu-ids/rstudio:latest --build-arg BASE_IMAGE=bioconductor/bioconductor_docker:devel .
```

### RStudio for JupyterHub

Build:

```bash
docker build -f jupyterhub.Dockerfile -t ghcr.io/maastrichtu-ids/rstudio:jupyterhub .
```

Run:

```bash
docker run -it -p 8888:8888 -e PASSWORD=password ghcr.io/maastrichtu-ids/rstudio:jupyterhub
```

Feel free to edit the `Dockerfile` to install additional packages in the image, and send a pull request!

> Alternatives:
>
> *  RStudio in Docker: [CSCfi RStudio image for OpenShift](https://github.com/CSCfi/rstudio-openshift/blob/master/server/Dockerfile)
> * Run the [Shiny server in a separate container](https://github.com/rocker-org/shiny)
