#!/bin/bash
find /var/log -type f -delete

history -c
rm /home/USER/.bash_history
