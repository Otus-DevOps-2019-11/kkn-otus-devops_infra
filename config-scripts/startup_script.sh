#!/bin/bash

#Update system
sudo apt-get update && sudo apt-get upgrade -y

#-----------------Install Ruby----------------------------
sudo apt install -y ruby-full ruby-bundler build-essential


#-----------------Install MongoDB-------------------------
#Import the MongoDB public GPG key for package signing:
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

#Add the MongoDB repository to system sources.list.d directory
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

#Fix for Travis tests
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

#Update repositories. This allows apt to read from the newly added MongoDB repo
sudo apt-get update

#Install MongoDB
sudo apt-get install -y mongodb-org

#Start MongoDB
sudo systemctl start mongod

#Add MongoDB to start on boot
sudo systemctl enable mongod


#-----------------Install APP-----------------------------
#Clone git repo
git clone -b monolith https://github.com/express42/reddit.git

#Change directory to reddit repo (cd reddit)
#Compiling and configuring all dependencies (bundle install)
#Start app (puma -d)
cd reddit && bundle install && puma -d
