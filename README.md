# Worldmap

```
https://github.com/tercen/shiny_worldmap_docker_operator.git
```
## Build

```bash
VERSION=0.1.0
docker build -t agouy/worldmap:$VERSION .
docker push agouy/worldmap:$VERSION
git add -A && git commit -m "$VERSION" && git tag -a $VERSION -m "++" && git push && git push --tags
```
