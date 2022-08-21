### Install docker / dockercompose ###
sudo usermod -aG sudo misaki
sudo apt-get update
sudo apt upgrade -y
# sudo apt-get install docker-compose
sudo apt install docker.io -y
sudo apt install curl vim -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo usermod -aG docker misaki