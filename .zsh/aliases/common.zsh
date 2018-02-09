###
# time to upgrade `ls`

# use coreutils `ls` if possible…
hash gls >/dev/null 2>&1 || alias gls="ls"

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias ls='gls -AFh ${colorflag} --group-directories-first'
alias lsd='ls -l | grep "^d"' # only directories
#    `la` defined in .functions
###

alias vim=vi

# various handy stuff
alias ....='cd ../..'
alias :e=vim
alias :qa=exit
alias :sp='test -n "$TMUX" && tmux split-window'
alias :vs='test -n "$TMUX" && tmux split-window -h'
alias :wq=exit
alias a=ag
alias b=bundle
alias be='bundle exec'
alias cd..='cd ..'
alias cdtmp='cd $(mktemp -d $TMPDIR/$USER-cdtmp-XXXXXX)'
alias clip='nc localhost 8377'
alias d='hash -d'
alias e=exit
#alias f='ssh -N -f sandbox-clipper'
alias g=git
alias groot='cd $(git rev-parse --show-toplevel 2> /dev/null || echo -n ".")'
alias h=history
alias j=jump
alias k='ssh sandbox killall -u glh sshd'
alias l='ls -F'
alias ll='ls -laF'
alias m=mosh
alias o='git oneline'
alias p='git patch'
alias oo='git oneline -10'
alias s=ssh
alias serve='python -m SimpleHTTPServer' # optional arg: port (defaults to 8000)
alias t=tmux
alias v=vim

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done
