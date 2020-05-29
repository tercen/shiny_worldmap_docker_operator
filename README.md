# Worldmap

```
https://github.com/tercen/shiny_worldmap_docker_operator.git
```
## Build

```bash
VERSION=0.0.4
docker build -t tercen/worldmap:$VERSION .
docker push tercen/worldmap:$VERSION
git add -A && git commit -m "$VERSION" && git tag -a $VERSION -m "++" && git push && git push --tags
```

```bash
# renv cache ~/.local/share/renv
docker run -it --rm --entrypoint "/bin/bash" tercen/worldmap:0.0.4
```