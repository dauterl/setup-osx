#!/usr/bin/env bash

for ARG in "$@"
do 

if [ $ARG == "base" ] || [ $ARG == "all" ]; then
    # Run the base setup
    echo ""
    echo "------------------------------"
    echo "Updating OSX and installing Xcode command line tools"
    echo "------------------------------"
    echo "Updating OSX.  If this requires a restart, run the script again."
    # Install all available updates
    sudo softwareupdate -ia --verbose
    echo "------------------------------"
    echo "Installing Xcode Command Line Tools."
    # Install Xcode command line tools
    xcode-select --install
    echo "------------------------------"
    echo "Installing Homebrew"
    echo "------------------------------"
    # Check for Homebrew, install if we don't have it
    if test ! $(which brew); then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # Make sure we’re using the latest Homebrew.
    brew update
fi

if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
    # Run the brew.sh Script
    echo ""
    ./brew.sh
    brew upgrade --all
fi

if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            # Run the osx.sh Script
            # I strongly suggest you read through the commented osx.sh
            # source file and tweak any settings based on your personal
            # preferences. The script defaults are intended for you to
            # customize. For example, if you are not running an SSD you
            # might want to change some of the settings listed in the
            # SSD section.
            echo ""
            echo "------------------------------"
            echo "Setting sensible OSX defaults."
            echo "------------------------------"
            echo ""
            ./osx.sh
        fi
done
