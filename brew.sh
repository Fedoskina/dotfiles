#!/bin/sh

brew install fish
sudo bash -c 'echo "/usr/local/bin/fish" >> /etc/shells'
chsh -s /usr/local/bin/fish

brew install fzf