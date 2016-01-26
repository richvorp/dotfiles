#!/usr/bin/env bash

sudo -v

brew update
brew upgrade --all

# install basic brew kegs
brew install wget
brew install phantomjs
brew install ack
brew install redis
brew install geoip
brew install libyaml
brew install gnupg

# http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
brew install awscli
echo 'To setup aws keys run: aws configure'

#iterm2
brew cask install iterm2

# csshx https://www.outsideopen.com/csshx/
brew install csshx

# setup ruby
brew install ruby-install
brew install chruby

# other languages
brew install lua
