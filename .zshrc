# Path to your oh-my-zsh installation.
export ZSH="/Users/bram/.oh-my-zsh"

ZSH_THEME="agnoster"

export DEFAULT_USER=`whoami`

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(jenv init -)"
