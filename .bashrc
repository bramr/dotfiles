#!/bin/bash

alias doc='docker'
alias dom='docker-machine'

alias ll="ls -lv --grooup-directories-first"
alias df='df -H'
alias du='du -h -d 1'

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
