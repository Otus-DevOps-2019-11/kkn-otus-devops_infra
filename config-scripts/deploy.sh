#!/bin/bash

#Clone git repo
git clone -b monolith https://github.com/express42/reddit.git

#Change directory to reddit repo (cd reddit)
#Compiling and configuring all dependencies (bundle install)
#Start app (puma -d)
cd reddit && bundle install && puma -d
