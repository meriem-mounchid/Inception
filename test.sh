# Start an nginx container, give it the name 'mynginx' and run in the background
docker run --rm --name mywp --detach wordpress
# Get the IP address of the container
docker inspect mywp | grep IPAddress
docker run -it busybox sh
# Fetch the nginx homepage by using the container's IP address
busybox$ wget -q -O - 172.17.0.2:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>


## TEST 00 ##

docker network create mynet
docker run -it --net mynet --name mydb mariadb
docker run -d --net mynet --name mywp wordpress