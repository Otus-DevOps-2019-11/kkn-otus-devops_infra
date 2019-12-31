#!/bin/bash

#Update repositories
sudo apt update

#Install Ruby
sudo apt install -y ruby-full ruby-bundler build-essential

#Show ruby version
ruby -v

#Show bundler version
bundler -v
