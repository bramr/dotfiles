. ~/dotfiles/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[1;35m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;34m\]\W\[\033[1;36m\]\[\033[1;37m\]$(__git_ps1 "\[\033[1;37m\]|\[\033[1;32m\]%s")\[\033[1;37m\]>\[\033[0m\]'

export GOPATH=$HOME
export PATH=/usr/local/bin:$GOPATH/bin:/Users/bram/.cargo/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

TERM=xterm-256color
export EDITOR=/usr/bin/vim
