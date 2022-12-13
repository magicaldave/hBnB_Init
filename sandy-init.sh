#!/usr/bin/env bash
# Provide your github username, then the file to run as arguments.
# Update, install dependencies, and autoremove
if [ ! -d "$HOME/holbertonschool-AirBnB_clone_v4/" ]; then
    if [ ! "$1" ]; then
	REPO=https://github.com/Coleraines13/holbertonschool-AirBnB_clone_v4.git
    else
	REPO=https://github.com/$1/holbertonschool-AirBnB_clone_v4.git
    fi
else
    rm -rf ~/holbertonschool-AirBnB_clone_v4
fi
if [ ! -e "$HOME/sandy-run.sh" ]; then
    wget https://raw.githubusercontent.com/magicaldave/hBnB_Init/main/sandy-run.sh
fi
apt-get update && apt-get upgrade
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get install -y nodejs mysql-server python3-dev libmysqlclient-dev zlib1g-dev python3-lxml && apt autoremove
pip3 install mysqlclient SQLAlchemy Flask flask_cors flasgger pathlib2 jsonschema==3.0.1
npm install semistandard request --global
export NODE_PATH=/usr/lib/node_modules

# Go home
cd
# Start mySQL
sudo service mysql start
# Pull the repo
git clone $REPO
# Move into the repository
cd holbertonschool-AirBnB_clone_v4/
# Set up the database
cat web_flask/100-dump.sql | mysql
# Dis is da sauce right here bois
if [ "$2" ]; then
    PROJ=$2
else
    PROJ=0
fi
~/sandy-run.sh $PROJ
