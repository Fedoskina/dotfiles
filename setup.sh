#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

git submodule init
git submodule update --init --recursive

declare -a files=(
  .dircolors
  .gitconfig
  .gitignore
  .gitattributes
  .hushlogin
  .inputrc
  .oh-my-zsh
  .terminfo
  .vim
  .vimrc
  .zsh
  .zshrc
)

for file in "${files[@]}"; do
  if [ ! -f ~/$file ] && [ ! -d ~/$file ]; then
    echo "Creating symlink to $file in home directory."
    ln -s $DIR/$file ~/$file
  fi
done

if [ -f ~/.npmrc ]; then
  NPM_AUTH_TOKEN=`cat ~/.npmrc | grep _authToken`
  cp $DIR/.npmrc ~/.npmrc
  echo $NPM_AUTH_TOKEN >> ~/.npmrc
else
  cp $DIR/.npmrc ~/.npmrc
fi

if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
fi

if [ ! -d ~/.ssh/control ]; then
  mkdir -p ~/.ssh/control
  chmod 0700 ~/.ssh/control
fi

cp -f $DIR/.ssh/config ~/.ssh/config

chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/config

declare -a terminfos=(
  tmux-256color.terminfo
  tmux.terminfo
  xterm-256color.terminfo
)

for file in "${terminfos[@]}"; do
  tic -o ~/.terminfo ~/.terminfo/$file
done

# improve perf of git inside of chromium checkout
# https://chromium.googlesource.com/chromium/src/+/master/docs/mac_build_instructions.md

# default is (257*1024)
sudo sysctl kern.maxvnodes=$((512*1024))

echo kern.maxvnodes=$((512*1024)) | sudo tee -a /etc/sysctl.conf

# speed up git status (to run only in chromium repo)
git config status.showuntrackedfiles no
git update-index --untracked-cache
