#!/usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Heroku
brew install heroku/brew/heroku
heroku update

#Install AWS CLI
brew install awscli
chmod 755 /usr/local/lib/pkgconfig
brew link awscli

# Install Docker, which requires virtualbox
brew install docker
brew install boot2docker

#Install Spark
brew install apache-spark

# Install data stores
brew install postgresql
brew tap mongodb/brew
brew install mongodb-community@4.0
brew install redis
brew cask install homebrew/cask-versions/adoptopenjdk8
brew install elasticsearch

echo "------------------------------"
echo "Installing Python"
# Install Python
brew install python3

# Remove outdated versions from the cellar.
brew cleanup

###############################################################################
# Install R
###############################################################################
echo "------------------------------"
echo "Installing R"

cd /usr/local && curl -#L https://cran.r-project.org/src/base/R-3/R-3.6.1.tar.gz | sudo tar -xzv

cd R-3.6.1 
./configure
make
make check
make pdf
make info
make install
make install-info
make install-pdf
echo "------------------------------"

