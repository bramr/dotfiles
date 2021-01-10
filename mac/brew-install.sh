#!/bin/bash

# Install most of my mac packages

brew install coreutils jq fzf jump bat tree
brew install tmux vim moreutils atool htop git wget nmap sshfs
brew install maven kubernetes-cli watch mas peco tig ncdu pwsafe
brew install ipcalc httpie youtube-dl go python3

brew install --cask iterm2 firefox brave-browser joplin
brew install --cask google-chrome visual-studio-code docker vlc
brew install --cask secure-pipes cyberduck disk-inventory-x
brew install --cask typora postman mysqlworkbench osxfuse sequel-pro
brew install --cask the-unarchiver qbittorrent sonic-pi discord
brew install --cask alfred

brew tap homebrew/cask-versions
brew install jenv openjdk@11 adoptopenjdk8 adoptopenjdk kotlin

brew tap clangen/musikcube
brew install musikcube


# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
# brew tap homebrew/cask-fonts
# brew install font-hack font-inconsolata
# brew cask install eclipse-jee


mkdir -p ~/Developer/Bram
cd ~/Developer/Bram
git clone https://github.com/jarun/nnn.git
cd nnn && make O_NERD=1 && mkdir ~/bin && cp nnn ~/bin/

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
