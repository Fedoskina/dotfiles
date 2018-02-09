# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

# turn off flow control (prevent CTRL-S from capturing all output)
stty -ixon

ZSH_THEME="dst"
ZSH_CUSTOM=$HOME/.zsh/oh-my-zsh-custom

plugins=(
  docker
  docker-aliases
  git
)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/keybindings.zsh
source $HOME/.zsh/vars.zsh

FZF_DIR=/usr/local/opt/fzf/
if [ -d $FZF_DIR ]; then
  source $FZF_DIR/shell/key-bindings.zsh
fi

GCP_SDK=/usr/local/Caskroom/google-cloud-sdk
if [ -d $GCP_SDK ]; then
  source $GCP_SDK/latest/google-cloud-sdk/path.zsh.inc
fi

HOST_RC=$HOME/.zsh/host/$HOSTNAME
if [ -f $HOST_RC ]; then
  source $HOST_RC
fi

LOCAL_RC=$HOME/.zshrc.local
if [ -f $LOCAL_RC ]; then
  source $LOCAL_RC
fi
