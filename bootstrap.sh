#!usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Create directory structure and get setup scripts from repo
export LOCAL_REPO='workspace/setup-osx'
cd ~
mkdir -p ${LOCAL_REPO} && cd ${LOCAL_REPO}
curl -#L https://github.com/dauterl/setup-osx/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}

echo Ready to run setup.sh
source ~/${LOCAL_REPO}/setup.sh ${1}
