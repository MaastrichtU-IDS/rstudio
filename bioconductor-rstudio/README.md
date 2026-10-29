
# Bioconductor RStudio Mirror

This folder manages the internal mirror for the Bioconductor Docker image. It exists to bypass Docker Hub authentication rate limits on the DSRI cluster.

## Mirroring Logic

This is a **Direct Mirror** handled by GitHub Actions. 
The workflow:
1. Pulls the official image from `bioconductor/bioconductor_docker:3.21-R-4.5.2`.
2. Re-tags it for our internal registry.
3. Pushes it to `ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21`.

## Version Information

- **Bioconductor**: 3.21
- **R Version**: 4.5.2
- **Internal URL**: `ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21`

## Run locally

```bash
docker pull ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21

docker run -it -p 8787:8787 -e PASSWORD=password ghcr.io/maastrichtu-ids/bioconductor-rstudio:3.21
```