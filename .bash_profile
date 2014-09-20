# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	    . ~/.bashrc
fi

export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH

PS1="\[\033[1;35m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h:\[\033[1;34m\]\W\[\033[1;36m\]\[\033[1;37m\]>\[\033[0m\]"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

TERM=xterm-256color
export EDITOR=/usr/bin/vim
