# Bioconductor RStudio Docker Image

Internal mirror of the official Bioconductor Docker image to avoid Docker Hub rate limits.

**Source**: https://hub.docker.com/r/bioconductor/bioconductor_docker

## Current Version

- Bioconductor: 3.21
- R: 4.5.2

## Build
```bash
docker build -t ghcr.io/maastrichtu-ids/rstudio:bioconductor-3.21 -f bioconductor/Dockerfile .
```

## Run
```bash
docker pull ghcr.io/maastrichtu-ids/rstudio:bioconductor-3.21
docker run -it -p 8787:8787 -e PASSWORD=password ghcr.io/maastrichtu-ids/rstudio:bioconductor-3.21
```
