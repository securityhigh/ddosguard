#!/bin/bash

mysqldump -u DBUSER DATABASE > /home/USER/db.sql
zip -r /home/USER/dump.zip /var/www/example.com/public

echo '[Done]'
