#!/usr/bin/env bash
# Provide the file to run as arguments, 0 by default.
cd ~/holbertonschool-AirBnB_clone_v4/
if [ "$1" ]; then
    PROJ=$1
else
    echo -n "Please enter what project you'd like to test: "
    read PROJ
fi

if ([ ! -z $(pgrep -f "python3 -m api.v1.app") ]); then
    echo "Api is already up!"
    HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db python3 -m web_dynamic.$PROJ-hbnb
else
    HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db HBNB_API_PORT=5001 python3 -m api.v1.app & HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db python3 -m web_dynamic.$PROJ-hbnb
fi
