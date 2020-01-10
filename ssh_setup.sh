#!/bin/sh
mkdir -p ~/.ssh && chmod 700 ~/.ssh
touch ~/.ssh/config
chmod 600 ~/.ssh/config
ssh-keygen -t rsa -b 4096 -C "email@domain.com"
eval "$(ssh-agent -s)"
#Be sure to edit config file to load the key into ssh-agent
#Example Config
# Host *
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_rsa
ssh-add -K ~/.ssh/id_rsa
#copy and add public key to git
pbcopy < ~/.ssh/id_rsa.pub
#clone repo
cd workspace
git clone git@github.com: ${org}/${repo}.git
