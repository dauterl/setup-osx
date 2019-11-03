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
brew install mongodb
brew install redis
brew cask install homebrew/cask-versions/adoptopenjdk8
brew install elasticsearch

echo "------------------------------"
echo "Installing Python"
# Install Python
brew install python3

# Remove outdated versions from the cellar.
brew cleanup

echo "------------------------------"
echo "Setting up pip."

# Install pip
sudo easy_install pip3 --user

###############################################################################
# Virtual Enviroments                                                         #
###############################################################################

echo "------------------------------"
echo "Setting up virtual environments."

# Install virtual environments globally
# It fails to install virtualenv if PIP_REQUIRE_VIRTUALENV was true
export PIP_REQUIRE_VIRTUALENV=false
pip3 install virtualenv --user
pip3 install virtualenvwrapper --user

export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py3-data virtual environment."

# Create a Python3 data environment
mkvirtualenv --python=/usr/local/bin/python3 py3-data
workon py3-data

# Install Python data modules
pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install pandas
pip3 install sympy
pip3 install nose
pip3 install unittest2
pip3 install seaborn
pip3 install scikit-learn
pip3 install "ipython[all]"
pip3 install bokeh
pip3 install Flask
pip3 install sqlalchemy
pip3 install mysqlclient

###############################################################################
# Install IPython Profile
###############################################################################

echo "------------------------------"
echo "Installing IPython Notebook Default Profile"

# Add the IPython profile
mkdir -p ~/.ipython
cp -r init/profile_default/ ~/.ipython/profile_default

echo "------------------------------"
echo "Script completed."
echo "Usage: workon py2-data for Python2"
echo "Usage: workon py3-data for Python3"

###############################################################################
# Install R
###############################################################################
echo "------------------------------"
echo "Installing R"
cd /usr/local && curl -#L https://stat.ethz.ch/R/daily/R-patched.tar.gz | tar -xzv
cd R && tools/rsync-recommended
echo "------------------------------"

