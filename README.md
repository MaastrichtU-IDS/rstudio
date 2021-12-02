**RStudio** image from https://hub.docker.com/r/rocker/tydiverse

Hosted on GitHub Container Registry ([ghcr.io](https://ghcr.io)) to avoid DockerHub pull limitations, and easily deploy on clusters (such as Kubernetes).

> Alternative: [CSCfi RStudio image for OpenShift](https://github.com/CSCfi/rstudio-openshift/blob/master/server/Dockerfile)

## Automatically updated

[![Publish Docker image](https://github.com/MaastrichtU-IDS/rstudio/workflows/Publish%20Docker%20image/badge.svg)](https://github.com/MaastrichtU-IDS/rstudio/actions)

The image on [ghcr.io](https://ghcr.io) is automatically updated every week (Monday at 3:00 GMT+1) by a GitHub Actions workflow to match the `latest` tag of [rocker/tydiverse](https://hub.docker.com/r/rocker/tydiverse)

## Run

```bash
docker run -d -p 8787:8787 -e PASSWORD=password -e ROOT=true -v $(pwd):/home/rstudio ghcr.io/maastrichtu-ids/rstudio:latest
```

In the container:

* User, with `sudo` privileges: `rstudio`
* Workspace path: `/home/rstudio`

Environment variables:

* `-e PASSWORD=password` : set password
* `-e ROOT=true` : enable `sudo` 
* `-e ADD=shiny` : install Shiny server on port 3838 at start (see [`rocker/shiny`](https://github.com/rocker-org/shiny) to run it in a separate container)

Start RStudio with Shiny server:

```bash
docker run -d -p 8787:8787 -p 3838:3838 -e PASSWORD=password -e ROOT=true -e ADD=shiny -v $(pwd):/home/rstudio ghcr.io/maastrichtu-ids/rstudio:latest
```

## Build

You can define the base image used to build RStudio with the build argument `BASE_IMAGE`, for example here with `bioconductor/bioconductor_docker:devel`

```bash
docker build -t ghcr.io/maastrichtu-ids/rstudio:latest --build-arg BASE_IMAGE=bioconductor/bioconductor_docker:devel .
```

Feel free to edit the `Dockerfile` to install additional packages in the image.

