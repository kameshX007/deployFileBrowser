#!/bin/sh
#Checking whether username is passed to script
#A docker folder will be created inside this users home directory and container persistant data will be stored there
dockerUser=$1;
[ -z "$dockerUser" ] && echo "Please pass username...!!!" && exit 0 || echo "Will be deploying container for user $dockerUser";

#Deploying docker compose
echo "Deploying File Browser...";
sudo mkdir -p /home/$dockerUser/docker/filebrowser;
cd /home/$dockerUser/docker/filebrowser && sudo touch filebrowser.db;
cd ..;
sudo chmod -R 777 filebrowser;

DOCKER_USER=$dockerUser docker-compose down
DOCKER_USER=$dockerUser docker-compose up -d
echo "File Browser deployment successfull...!!!";
exit 0