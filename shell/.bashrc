#!/bin/bash

alias w1='watch -n 1'
alias ll="ls -lvG"
alias df='df -H'
alias du='du -h -d 1'
alias n='nnn'
alias brew-cleanup='echo "Use --force to do actual cleanup (leaves Brewfile)" && brew bundle dump && brew bundle cleanup'

alias tx='tmux new-session -s local -n main \; split-window -h \; select-pane -t 1 \; send-keys "nnn" C-m \; new-window \; send-keys "cd ~" C-m \;  select-window -t 0 \; select-pane -t 0 \;'
alias txf='tmux new-session -s local -n main \; send-keys "pwd" C-m \; split-window -v \; split-window -h \; select-pane -t 1 \; send-keys "nnn" C-m \; select-pane -t 2 \; send-keys "htop" C-m \; select-pane -t 0 \; new-window -n music \; send-keys "cmus" C-m \; new-window -n home \; send-keys "cd ~" C-m \;  select-window -t 0 \;'

alias mf='mdfind -onlyin'

#git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbdel='git branch --delete'
alias gc='git commit --message'
alias gcx='git commit'
alias gcob='git checkout -b'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gd='git diff HEAD'
alias gd1='git diff HEAD~1 HEAD'
alias gd2='git diff HEAD~2 HEAD~1'
alias gd3='git diff HEAD~3 HEAD~2'
alias gd4='git diff HEAD~4 HEAD~3'
alias gd5='git diff HEAD~5 HEAD~4'
alias gd6='git diff HEAD~6 HEAD~5'
alias gd7='git diff HEAD~7 HEAD~6'
alias gd8='git diff HEAD~8 HEAD~7'
alias gd9='git diff HEAD~9 HEAD~8'
alias glg='git log --graph --oneline --decorate --all'
alias glo='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gpl='git pull'
alias gs='git status'
alias gss='git status --short'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstd='git stash pop'
alias gstl='git stash list'
alias gsts='git stash save'

#docker
alias dk='docker'
alias dkb='docker build -t'
alias dke='docker exec -it'
alias dki='docker images'
alias dkl='docker logs -f'
alias dkp='docker ps -f'
alias dkps='docker ps --filter "status=exited"'
alias dkr='docker rm -f'
alias dkfullclear='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dkc='docker-compose'
alias dkcu='docker-compose up -d'
alias dkcl='docker-compose logs -f'


# machine dependent stuff/ environment vars
if [ -f ~/.bash_local.sh ]; then
    . ~/.bash_local.sh
fi
