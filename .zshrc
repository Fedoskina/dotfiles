# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dst"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/keybindings.zsh
source $HOME/.zsh/vars.zsh

HOST_RC=$HOME/.zsh/host/$HOSTNAME
if [ -f $HOST_RC ]; then
  source $HOST_RC
fi

LOCAL_RC=$HOME/.zshrc.local
if [ -f $LOCAL_RC ]; then
  source $LOCAL_RC
fi
