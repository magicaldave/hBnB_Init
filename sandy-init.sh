#!/usr/bin/env bash
# Provide your github username, then the file to run as arguments.
# Update, install dependencies, and autoremove
if [ ! -d "$HOME/holbertonschool-AirBnB_clone_v4/" ]; then
    if [ ! "$1" ]; then
	echo -n "Please enter your GitHub username: "
	read USER
	REPO=https://github.com/$USER/holbertonschool-AirBnB_clone_v4.git
    else
	REPO=https://github.com/$1/holbertonschool-AirBnB_clone_v4.git
    fi
else
    rm -rf ~/holbertonschool-AirBnB_clone_v4
fi

apt-get update && apt-get upgrade
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get install -y nodejs mysql-server python3-dev libmysqlclient-dev zlib1g-dev python3-lxml && apt autoremove
pip3 install mysqlclient SQLAlchemy Flask flask_cors flasgger pathlib2 jsonschema==3.0.1
npm install semistandard request --global
export NODE_PATH=/usr/lib/node_modules

# Go home
cd
# Grab the runner script
wget https://raw.githubusercontent.com/magicaldave/hBnB_Init/main/sandy-run.sh && chmod u+x sandy-run.sh
# Start mySQL
sudo service mysql start
# Pull the repo
git clone $REPO
# Move into the repository
cd holbertonschool-AirBnB_clone_v4/
# Set up the database
cat web_flask/100-dump.sql | mysql
# Dis is da sauce right here bois
../sandy-run.sh
# sudo su -c "bash <(wget -qO- https://raw.githubusercontent.com/magicaldave/hBnB_Init/main/sandy-run.sh)"
