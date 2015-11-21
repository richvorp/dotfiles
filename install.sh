#!/usr/bin/env bash

if [ ! -f ~/.private ]; then
  cp .private ~
fi
# create empty .bash_profile for custom entries if not there
if [ ! -f ~/.bash_profile ]; then
  echo "source ~/.profile" > ~/.bash_profile
fi

source ~/.private

# check if homebrew exists, otherwise install it
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# run all brew stuff
./brew.sh

git/install.sh
cp -r home/. ~


source ~/.profile
source ~/.bash_profile
