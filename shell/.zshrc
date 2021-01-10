# Shell specific setup
if [ -d "$HOME/.oh-my-zsh" ]
then
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="agnoster"
  #plugins=()
  source $ZSH/oh-my-zsh.sh
  autoload -z edit-command-line
  zle -N edit-command-line
  bindkey '^K' edit-command-line
elif [ $(basename $SHELL) == "bash" ]
then
  . ~/dotfiles/shell/git-prompt.sh
  bind "C-k":"edit-and-execute-command"
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1='\[\033[1;35m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;34m\]\W\[\033[1;36m\]\[\033[1;37m\]$(__git_ps1 "\[\033[1;37m\]|\[\033[1;32m\]%s")\[\033[1;37m\]>\[\033[0m\]'
  export CLICOLOR=1
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

# Core aliases
alias w1='watch -n 1'
alias ls='ls -lhvG'
alias ll='ls -a'
alias df='df -H'
alias du='du -h -d 1'
alias dus='du -h -d 1 | sort -h'
alias dus2='du -h -d 2 | sort -h'
alias dus3='du -h -d 3 | sort -h'
alias emoji="$EDITOR ~/dotfiles/misc/emoji.txt"

[ -x "$(command -v nnn)" ] && . ~/dotfiles/shell/nnn.sh

[ -x "$(command -v musikcube)" ] && alias mus='musikcube'
[ -x "$(command -v tmux)" ] && alias tmux='tmux -f ~/dotfiles/tmux/.tmux.conf' \
  && alias tx='tmux new-session -A -s "$(hostname -s)"' \
  && alias txls='tmux ls'

# Docker
[ -x "$(command -v docker)" ] && alias dk='docker' \
  && alias dkp='docker ps' \
  && alias dkps='docker ps --filter "status=exited"'

# Docker compose
[ -x "$(command -v docker-compose)" ] && alias dc='docker-compose' \
  && alias dcup='docker-compose up -d' \
  && alias dclog='docker-compose logs -f'

# Git
[ -x "$(command -v git)" ] && alias ga='git add' \
  && alias gaa='git add --all' \
  && alias gb='git branch' \
  && alias gc='git commit --message' \
  && alias gca='git commit --amend' \
  && alias gcx='git commit' \
  && alias gco='git checkout' \
  && alias gcom='git checkout master' \
  && alias gd='git diff HEAD' \
  && alias gd1='git diff HEAD~1 HEAD' \
  && alias gd2='git diff HEAD~2 HEAD~1' \
  && alias gd3='git diff HEAD~3 HEAD~2' \
  && alias gd4='git diff HEAD~4 HEAD~3' \
  && alias gd5='git diff HEAD~5 HEAD~4' \
  && alias gd6='git diff HEAD~6 HEAD~5' \
  && alias gd7='git diff HEAD~7 HEAD~6' \
  && alias gd8='git diff HEAD~8 HEAD~7' \
  && alias gd9='git diff HEAD~9 HEAD~8' \
  && alias glg='git log --graph --oneline --decorate --all' \
  && alias glo='git log --pretty=format:"%h %ad %s" --date=short --all' \
  && alias gp='git pull --ff-only' \
  && alias gpl='git pull' \
  && alias gs='git status --short' \
  && alias gsta='git stash apply' \
  && alias gstd='git stash drop' \
  && alias gstd='git stash pop' \
  && alias gstl='git stash list' \
  && alias gsts='git stash save'

# Youtube
[ -x "$(command -v youtube-dl)" ] \
 && alias yt="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' " \
 && alias ytf="youtube-dl -F " \
 && alias yta="youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 3 "

case "$OSTYPE" in
  darwin*) . "$HOME/dotfiles/shell/mac.sh" ;;
  linux*) . "$HOME/dotfiles/shell/linux.sh" ;;
esac

[ -f "$HOME/.local.sh" ] && . "$HOME/.local.sh"

echo "👾👾👾 $(basename $SHELL) config loaded 👾👾👾"
