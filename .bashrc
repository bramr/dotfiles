#!/bin/bash

alias doc='docker'
alias dom='docker-machine'

alias ll="ls -lvG"
alias df='df -H'
alias du='du -h -d 1'

# machine dependent stuff/ environment vars
if [ -f ~/.bash_local.sh ]; then
	    . ~/.bash_local.sh
fi

function dockup {
	if [ -z "$1" ]; then
		echo "Listing available machines:"
		docker-machine ls
		echo $'\nUsage: dockup <machine-id>'
	else
		docker-machine start $1
		docker-machine env $1
		eval "$(docker-machine env $1)"
	fi
}
