#!/bin/bash

# Install most of my mac packages

brew install tmux vim moreutils atool htop git wget nmap sshfs
brew install maven kubernetes-cli watch cmus mas peco tig ncdu pwsafe
brew install ipcalc httpie youtube-dl go python3


brew cask install alfred iterm2 firefox brave-browser
brew cask google-chrome visual-studio-code docker vlc
brew cask install secure-pipes cyberduck disk-inventory-x
brew cask install typora postman osxfuse sequel-pro
brew cask install the-unarchiver pluralsight mysqlworkbench
brew cask install qbittorrent sonic-pi discord

brew tap homebrew/cask-versions
brew install jenv openjdk@11 adoptopenjdk8 adoptopenjdk kotlin

brew tap clangen/musikcube
brew install musikcube

brew install coreutils jq fzf jump bat tree

mkdir -p ~/Developer/Bram
cd ~/Developer/Bram
git clone https://github.com/jarun/nnn.git
cd nnn && make O_NERD=1 && mkdir ~/bin && cp nnn ~/bin/

# fonts
# brew tap homebrew/cask-fonts
# brew install font-hack font-inconsolata
# brew cask install eclipse-jee

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
