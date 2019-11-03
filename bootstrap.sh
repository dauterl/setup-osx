#!usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Create directory structure and get setup scripts from repo
export REPO='Development/Repositories/setup-osx'
cd ~
mkdir -p ${REPO} && cd ${REPO}
curl -#L https://github.com/dauterl/setup-osx/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}

echo Ready to run setup.sh
source ~/${REPO}/setup.sh all
