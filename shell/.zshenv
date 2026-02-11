export DEFAULT_USER=`whoami`

export PATH=~/bin:~/dotfiles/bin:/opt/homebrew/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

if [ -x "$(command -v nvim)" ]
then
	export VISUAL=nvim
	export EDITOR="$VISUAL"
else
	export VISUAL=vi
	export EDITOR="$VISUAL"
fi

# Enable jenv if installed
[ -d "$HOME/.jenv/bin" ] && export PATH="$HOME/.jenv/bin:$PATH" && eval "$(jenv init -)"

# Enable composer global bin
[ -d "$HOME/.composer/vendor/bin" ] && export PATH="$HOME/.composer/vendor/bin:$PATH"

export COLIMA_HOME=/Volumes/owc/data/colima/
export OLLAMA_MODELS=/Volumes/owc/data/ollama/models/
