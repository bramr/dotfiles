#!/bin/bash

# Install most of my mac packages

brew install tmux nnn vim moreutils atool htop git wget nmap sshfs
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

brew cask install eclipse-jee

# fonts
brew tap homebrew/cask-fonts
brew install font-hack font-inconsolata

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
