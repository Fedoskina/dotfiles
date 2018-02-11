#!/bin/sh

brew install zsh
sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

brew install fzf

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

brew install yarn

brew install pstree

brew cask install caskroom/versions/java8
brew install maven

brew cask install docker-edge
brew install kubectl
