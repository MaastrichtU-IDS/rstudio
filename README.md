[![Publish Docker image](https://github.com/MaastrichtU-IDS/rstudio/workflows/Publish%20Docker%20image/badge.svg)](https://github.com/MaastrichtU-IDS/rstudio/actions)

RStudio image from https://hub.docker.com/r/rocker/tydiverse

Hosted on GitHub Container Registry (ghcr.io) to avoid DockerHub pull limitations.

> Alternative: [CSCfi RStudio image for OpenShift](https://github.com/CSCfi/rstudio-openshift/blob/master/server/Dockerfile)

## Automatically updated

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

Feel free to edit the `Dockerfile` to add packages to install in the image.

```bash
docker build -t ghcr.io/maastrichtu-ids/rstudio:latest .
```

## Push

```bash
docker push ghcr.io/maastrichtu-ids/rstudio:latest
```

