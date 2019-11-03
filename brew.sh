#!/usr/bin/env bash

#Get admin pw
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing Core GNU Utilities."
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
echo "------------------------------"

echo "------------------------------"
echo "Installing Zshell."
# Install Zsh.
brew install zsh
# Get Oh My Zsh
0>/dev/null sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# We installed the new shell, now we have to activate it
chsh -s $(which zsh)
echo "------------------------------"

echo "------------------------------"
echo "Installing other tools."
# Install `wget` with IRI support.
brew install wget

# Install more recent versions of some OS X tools.
brew install vim
brew install grep
brew install screen
brew install php55

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install C Stuff
brew install gcc ccache cmake pkg-config autoconf automake

# Install SSL/SSH Stuff
brew install openssl libressl libssh

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install direnv
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2
echo "------------------------------"

echo "------------------------------"
echo "Installing casks."
# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" macdown

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" dbeaver-community
echo "------------------------------"

# Remove outdated versions from the cellar.
brew cleanup
