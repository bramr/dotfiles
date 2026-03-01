
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[1;35m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;34m\]\W\[\033[1;36m\]\[\033[1;37m\]$(__git_ps1 "\[\033[1;37m\]|\[\033[1;32m\]%s")\[\033[1;37m\]>\[\033[0m\]'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

. ~/dotfiles/shell/git-prompt.sh
bind "C-k":"edit-and-execute-command"


# Jump setup
[ -x "$(command -v jump)" ] && eval "$(jump shell bash)"

source ~/dotfiles/shell/aliases.sh
