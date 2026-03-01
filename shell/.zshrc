
# Use starship prompt if available.
[ -x "$(command -v starship)" ] &&  eval "$(starship init zsh)"

autoload -U colors ; colors

# Recommended keybindings for vim mode.
bindkey -v
export KEYTIMEOUT=1

# Edit command line in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey -v
bindkey '^K' edit-command-line

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vi style keys in tab complete menu.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search

# Use fzf for history, cd, file opening, process killing, and git operations if available.
if command -v fzf >/dev/null 2>&1; then
  fzf-history-widget() {
    local selected
    selected=$(fc -rl 1 | fzf --height 40% --reverse --border) || return
    LBUFFER=$(echo "$selected" | sed 's/^[ ]*[0-9]*[ ]*//')
  }
  zle -N fzf-history-widget

  fzf-cd-widget() {
    local dir
    dir=$(find . -type d -not -path '*/\.*' 2>/dev/null | \
          fzf --height 40% --reverse --border --prompt="cd > ") || return
    cd "$dir" || return
    zle reset-prompt
  }
  zle -N fzf-cd-widget

  fzf-open() {
    local file
    # Use `find` to generate a list of files starting from the current directory
    file=$(find . -type f | fzf --height 40% --reverse --border --prompt="Open file > ") || return
    if [[ -z "$file" ]]; then
      echo "No file selected."
      return
    fi
    ${EDITOR:-vim} "$file"
  }
  zle -N fzf-open

  fzf-kill() {
    local pid
    pid=$(ps -ef | fzf --height 40% --reverse --border --prompt="Kill PID > " | awk '{print $2}') || return
    kill -9 "$pid"
  }
  zle -N fzf-kill

  fzf-git-branch() {
    local branch
    branch=$(git branch --all | sed 's/.* //g' | fzf --height 40% --reverse --border --prompt="Branch > ") || return
    git checkout "$branch"
  }
  zle -N fzf-git-branch

  fzf-git-log() {
    local commit
    commit=$(git log --oneline --color=always | fzf --ansi --height 40% --reverse --border --prompt="Commit > ") || return
    git show $(echo $commit | awk '{print $1}')
  }
  zle -N fzf-git-log

  # Bind keys for fzf widgets
  bindkey '^G' fzf-cd-widget
  bindkey '^R' fzf-history-widget
  bindkey '^O' fzf-open
  bindkey '^Xk' fzf-kill
  bindkey '^Xb' fzf-git-branch
  bindkey '^Xl' fzf-git-log
else
  # Fallback for history
  bindkey '^R' history-incremental-search-backward
fi

# Cargo
[ -x "$(command -v cargo)" ] \
  && source "$HOME/.cargo/env"

# LM Studio CLI
[ -d "$HOME/.lmstudio/bin" ] && export PATH="$PATH:$HOME/.lmstudio/bin"

# Jump directory
[ -x "$(command -v jump)" ] && eval "$(jump shell zsh)"

case "$OSTYPE" in
  darwin*) . "$HOME/dotfiles/shell/mac.sh" ;;
  linux*) . "$HOME/dotfiles/shell/linux.sh" ;;
esac

source ~/dotfiles/shell/aliases.sh

# Local overrides
[ -f "$HOME/.local.sh" ] && . "$HOME/.local.sh"

# Zsh addons install via Homebrew.
[ -f "/opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] \
  && source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Shell greeting to see config is loaded. (only in interactive shells)
if [[ $- == *i* ]]
then
  [ -x "$(command -v figlet)" ] && [ -x "$(command -v lolcat)" ] &&
    figlet  -f ~/dotfiles/shell/invita.flf "$(basename $SHELL)" | lolcat ||
    echo "👾👾👾 $(basename $SHELL) config loaded 👾👾👾"
fi
