# Use fish if available only on interactive alacritty.
[[ $- == *i* ]] && [[ $TERM_PROGRAM = "alacritty" ]] && [ -x "$(command -v fish)" ] && fish

if [ $(basename $SHELL) = "zsh" ]
then
  # Shell specific setup
  [ -x "$(command -v starship)" ] &&  eval "$(starship init zsh)"

  autoload -z edit-command-line
  zle -N edit-command-line
  bindkey -v
  bindkey '^K' edit-command-line
  bindkey '^R' history-incremental-search-backward

  # History
  HISTFILE=~/.zsh_history
  HISTSIZE=100000
  SAVEHIST=100000
  setopt share_history
  setopt hist_expire_dups_first
  setopt hist_ignore_dups
  setopt hist_verify

  bindkey '^[[A' history-search-backward
  bindkey '^[[B' history-search-forward

  # Zsh completion
  [ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [ -f "/opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ] && source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

elif [ $(basename $SHELL) = "bash" ]
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

# replace ls with exa
[ -x "$(command -v exa)" ] \
  && alias ls='exa -l --icons --group-directories-first --git' \
  && alias ll='exa -al --icons --group-directories-first --git'

# always use neovim if available
[ -x "$(command -v nvim)" ] \
  && alias vim='nvim' \
  && alias vi='nvim'

[ -x "$(command -v nnn)" ] && . ~/dotfiles/shell/nnn.sh

[ -x "$(command -v musikcube)" ] && alias mus='musikcube'
[ -x "$(command -v tmux)" ] && alias tmux='tmux -f ~/dotfiles/tmux/.tmux.conf' \
  && alias tx='tmux new-session -A -s "$(hostname -s)"' \
  && alias txls='tmux ls'

[ -x "$(command -v jump)" ] && eval "$(jump shell)" \
  && alias jp='jump pins'

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
  && alias gc='git commit' \
  && gm() { git commit -m "$*" } \
  && alias gca='git commit --amend --no-edit' \
  && alias gcx='git commit' \
  && alias gco='git checkout' \
  && alias gcom='git checkout master' \
  && alias gd='git diff HEAD' \
  && alias gds='git diff --staged' \
  && alias gd1='git diff HEAD~1 HEAD' \
  && alias gd2='git diff HEAD~2 HEAD~1' \
  && alias gd3='git diff HEAD~3 HEAD~2' \
  && alias gd4='git diff HEAD~4 HEAD~3' \
  && alias gd5='git diff HEAD~5 HEAD~4' \
  && alias gd6='git diff HEAD~6 HEAD~5' \
  && alias gd7='git diff HEAD~7 HEAD~6' \
  && alias gd8='git diff HEAD~8 HEAD~7' \
  && alias gd9='git diff HEAD~9 HEAD~8' \
  && alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold blue)(%ar) %C(green)<%an>%Creset' --abbrev-commit" \
  && alias glo='git log --pretty=format:"%Cred%h%Creset %C(bold blue)%ad%Creset %s %Cgreen%ae%Creset" --date=short --all' \
  && alias gp='git pull --ff-only' \
  && alias gpl='git pull' \
  && alias gpush='git push origin' \
  && alias gre='git rebase' \
  && alias grc='git rebase --continue' \
  && alias gs='git status --short' \
  && alias gsta='git stash apply' \
  && alias gstd='git stash drop' \
  && alias gstd='git stash pop' \
  && alias gstl='git stash list' \
  && alias gsts='git stash save'

# Youtube
[ -x "$(command -v yt-dlp)" ] \
  && alias yt="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' " \
  && alias ytf="yt-dlp -F " \
  && alias yta="yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 3 "

# Weather
alias wt="curl \"https://wttr.in/Nijmegen?0qpF\""
alias wtr="curl \"https://wttr.in/Nijmegen?qnpF\""
alias wtrx="curl \"https://wttr.in/Nijmegen?qpF\""

case "$OSTYPE" in
  darwin*) . "$HOME/dotfiles/shell/mac.sh" ;;
  linux*) . "$HOME/dotfiles/shell/linux.sh" ;;
esac

[ -f "$HOME/.local.sh" ] && . "$HOME/.local.sh"

# Cargo
[ -x "$(command -v cargo)" ] \
  && source "$HOME/.cargo/env"

if [[ $- == *i* ]]
then
  [ -x "$(command -v figlet)" ] && [ -x "$(command -v lolcat)" ] &&
    figlet  -f ~/dotfiles/shell/invita.flf "$(basename $SHELL)" | lolcat ||
    echo "👾👾👾 $(basename $SHELL) config loaded 👾👾👾"
fi
