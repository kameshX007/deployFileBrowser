#!/bin/sh
#Checking whether username is passed to script
#A docker folder will be created inside this users home directory and container persistant data will be stored there
dockerUser=$1;
[ -z "$dockerUser" ] && echo "###Please pass username...!!!">>deployFileBrowser.log && exit 0 || echo "Will be deploying container for user $dockerUser">>deployFileBrowser.log;

#Deploying docker compose
echo "Deploying File Browser...">>deployFileBrowser.log;
DOCKER_USER=$dockerUser docker-compose down
DOCKER_USER=$dockerUser docker-compose up -d
echo "File Browser deployment successfull...">>deployFileBrowser.log;
exit 0
