#!usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Create directory structure and get setup scripts from repo
cd ~
mkdir Development && mkdir Development/Repositories && mkdir Development/Repositories/setup-osx && cd Development/Repositories/setup-osx
curl -#L https://github.com/dauterl/setup-osx/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}

echo Ready to run setup.sh
sh ./Development/Repositories/setup-osx/setup.sh all
