### Install SSH On Ubuntu ###
sudo apt install openssh-server -y
sudo usermod -aG sudo misaki

### Install docker / dockercompose ###
sudo apt-get update
sudo apt upgrade -y
# sudo apt-get install docker-compose
sudo apt install docker.io -y
sudo apt install curl vim -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo usermod -aG docker misaki

### Delete docker-compose ###
sudo rm /usr/local/bin/docker-compose
sudo apt remove docker-compose -y
sudo apt autoremove -y
# ?: --user

### Using DockerCompose To Create MariaDB ###
# sudo systemctl status docker
#mkdir mariadb wordpress nginx
#touch mariadb/Dockerfile wordpress/Dockerfile nginx//Dockerfile
docker-compose up -d
docker-compose exec mariadb /bin/bash
mysql -u citizix_user -pAn0thrS3crt
# mysql -u misaki_user -pmisaki
sudo userdel mysql
sudo useradd -u 999 mysql
sudo mkdir -p /data/mysql
sudo chown -R mysql:mysql /data/mysql

sudo userdel www-data
sudo useradd -u 82 www-data
sudo mkdir -p /data/html
sudo chown -R www-data:www-data /data/html
# docker-compose ps

# logging:
#   driver: syslog
#   options:
#     tag: "{{.DaemonName}}(image={{.ImageName}};name={{.Name}};id={{.ID}})"
# networks:
#   - backend
# restart: on-failure
# volumes:
#  - ${PWD}/mariadb:/var/lib/mysql
