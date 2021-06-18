#!/bin/bash

if [ "$4" = "install" ]
then
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install nginx python3 python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y
	sudo apt install python3-venv -y
fi

mkdir /home/$2/$1
cd /home/$2/$1
python3 -m venv venv

source venv/bin/activate

pip3 install wheel
pip3 install uwsgi flask

sudo ufw allow 5000
sudo ufw allow 'Nginx Full'

touch /home/$2/$1/socket.sock
echo -e "from flask import Flask\napp = Flask(__name__)\n\n@app.route('/')\ndef hello():\n    return '<b>securityhigh</b>'\n\nif __name__ == '__main__':\n    app.run(host='0.0.0.0')" >> /home/$2/$1/main.py
echo -e "from main import app\n\nif __name__ == '__main__':\n    app.run()" >> /home/$2/$1/wsgi.py
echo -e "[uwsgi]\nmodule = main\ncallable = app\nmaster = true\nprocesses = 5\nsocket = socket.sock\nchmod-socket = 660\nvacuum = true\ndie-on-term = true" >> /home/$2/$1/config.ini
sudo echo -e "[Unit]\nDescription=uWSGI instance to serve $1\nAfter=network.target\n\n[Service]\nUser=$2\nGroup=www-data\nWorkingDirectory=/home/$2/$1\nEnvironment=\"PATH=/home/$2/$1/venv/bin\"\nExecStart=/home/$2/$1/venv/bin/uwsgi --ini config.ini\n\n[Install]\nWantedBy=multi-user.target" >> /etc/systemd/system/$1.service

sudo systemctl start $1
sudo systemctl enable $1

sudo echo -e "server {\n    listen 80;\n    server_name $3;\n\n    location / {\n        include uwsgi_params;\n        uwsgi_pass unix:/home/$2/$1/socket.sock;\n    }\n}" >> /etc/nginx/sites-available/$1.conf && sudo ln -s /etc/nginx/sites-available/$1.conf /etc/nginx/sites-enabled/
chown -R $2:www-data /home/$2/$1

sudo systemctl restart nginx && sudo systemctl restart $1