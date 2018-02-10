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
  kubectl
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

for alias_file in $HOME/.zsh/aliases/**/*; do
  source $alias_file
done

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
eval "$(gdircolors -b ~/.dircolors)"

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/keybindings.zsh
source $HOME/.zsh/path.zsh
source $HOME/.zsh/vars.zsh
#source $HOME/.zsh/yarn.zsh
source $HOME/.zsh/hacks/fast-git-dirty-check.zsh

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
