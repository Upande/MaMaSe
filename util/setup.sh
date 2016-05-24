#!/bin/bash
#Initial setup
echo "Starting setup"
sudo easy_install pip
sudo pip install virtualenvwrapper
sudo apt-get update
sudo apt-get install python-setuptools python-dev build-essential -y
sudo apt-get install nginx -y
sudo apt-get install git -y
sudo apt-get install postgresql postgresql-contrib -y

echo "Running libraries needed for requirements"
#Before running requirements
sudo apt-get install libpq-dev #For Postgres
sudo apt-get install libjpeg-dev #For jpeg

#Now run requirements
echo "Running requirements"
pip install -r requirements.txt