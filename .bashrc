#!/bin/bash

alias doc='docker'
alias docc='docker-compose'
alias w1='watch -n 1'

alias ll="ls -lvG"
alias df='df -H'
alias du='du -h -d 1'

# machine dependent stuff/ environment vars
if [ -f ~/.bash_local.sh ]; then
	    . ~/.bash_local.sh
fi
