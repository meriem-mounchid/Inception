### Delete Containers ###
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

### Delete Images ###
docker rmi -f $(docker images -q)

### Delete Volumes ###
docker volume prune

### Delete Network ###
docker network prune