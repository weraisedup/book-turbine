#!/bin/sh
## Nuke everything script!
docker-sync-stack clean
docker volume prune
docker container prune
docker image prune -a
