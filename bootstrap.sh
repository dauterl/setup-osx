#!usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Create directory structure

cd ~
mkdir Development && cd Development
mkdir Repositories && cd Repositories

cd Development/Repositories && curl -#L https://github.com/dauterl/setup-osx/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}

sh test.sh
