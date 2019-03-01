#!/bin/bash

# Install most of my mac packages

brew install tmux nnn vim moreutils atool htop git wget nmap sshfs maven kubernetes-cli watch

brew cask install alfred iterm2 firefox google-chrome visual-studio-code docker vlc spectacle
brew cask install secure-pipes cyberduck disk-inventory-x typora postman osxfuse sequel-pro java
# optional: brew cask install qbittorrent mysqlworkbench duet pluralsight mullvadvpn yujitach-menumeters

brew tap homebrew/cask-versions
brew install java8

# fonts
brew tap homebrew/cask-fonts
brew install font-hack font-inconsolata
