**RStudio** image with Shiny server based on the popular [Rocker RStudio image](https://github.com/rocker-org/rocker-versioned)

Hosted on GitHub Container Registry ([ghcr.io](https://ghcr.io)) to avoid DockerHub pull limitations, and easily deploy on clusters (such as Kubernetes).

## 🏷️ Automatically updated

[![Publish Docker image](https://github.com/MaastrichtU-IDS/rstudio/actions/workflows/publish-docker.yml/badge.svg)](https://github.com/MaastrichtU-IDS/rstudio/actions)

The image on [ghcr.io](https://ghcr.io) is automatically updated every week (Monday at 3:00 GMT+1) by a GitHub Actions workflow to match the `latest` tag of [rocker/verse](https://hub.docker.com/r/rocker/verse)

## 🐳 Run

Start RStudio on http://localhost:8787 with Shiny server on http://localhost:3838

```bash
docker run -it -p 8787:8787 -e PASSWORD=password -e ROOT=true ghcr.io/maastrichtu-ids/rstudio:latest
```

Environment variables:

* `-e PASSWORD=password` : set password
* `-e ROOT=true` : enable `sudo` 

In the container when using the flag ROOT=true:

* Workspace path is `/root`
* User is `root` with `sudo` privileges

## 📦️ Build

```bash
docker build -f Dockerfile -t ghcr.io/maastrichtu-ids/rstudio:latest .
```

## Bioconductor RStudio Docker Image

Internal mirror of the official Bioconductor Docker image to avoid Docker Hub rate limits.

**Source**: https://hub.docker.com/r/bioconductor/bioconductor_docker

## Version Information

- **Bioconductor**: 3.21
- **R Version**: 4.5.2
- **Internal URL**: `ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21`

## Build

```bash
docker build -f bioconductor/Dockerfile -t ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21 .
```

## Run

```bash
docker pull ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21

docker run -it -p 8787:8787 -e PASSWORD=password ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21
```
