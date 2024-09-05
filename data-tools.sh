#!/usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Install Cloud Provider CLI CLI
#brew install awscli
#chmod 755 /usr/local/lib/pkgconfig
#brew link awscli

brew install --cask google-cloud-sdk


brew tap databricks/tap

brew install --cask snowflake-snowsql

curl -s https://raw.githubusercontent.com/dbt-labs/dbt-core-snapshots/main/install_bundle.sh | bash -s -- 1.6.3 3.9 mac



# Install Docker, which requires virtualbox
brew install docker
brew install boot2docker

#Install Spark
brew install apache-spark

# Install data stores
brew install postgresql
brew install redis

# Install dbt, Databricks, Snowflake
brew install databricks


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

