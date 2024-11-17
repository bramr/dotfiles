#!/usr/bin/env bash

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Theme color to orange
defaults write -g AppleAccentColor -int 3
defaults write NSGlobalDomain AppleHighlightColor -string "0.752900 0.964700 0.678400 1.000000"

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Empty out the dock
brew install dockutil

# Remove dock items
itemsToRemove=(
   "Address Book"
   "App Store"
   "Books"
   "Calendar"
   "Contacts"
   "Dictionary"
   "Downloads"
   "FaceTime"
   "Freeform"
   "Keynote"
   "Launchpad"
   "Mail"
   "Maps"
   "Messages"
   "Mission Control"
   "Music"
   "News"
   "Notes"
   "Numbers"
   "Pages"
   "Photos"
   "Podcasts"
   "Reminders"
   "Safari"
   "Settings"
   "Siri"
   "Stocks"
   "TextEdit"
   "TV"
)

for removalItem in "${itemsToRemove[@]}"
   do
      # Check that the item is actually in the Dock
      /opt/homebrew/bin/dockutil --remove "$removalItem" --no-restart
   done

brew remove dockutil

defaults write com.apple.dock tilesize -int 24
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string right

# Don't reorder spaces/ spaces span displays
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.spaces spans-displays -bool true

# Disable quick note
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0



killall Dock

# Trackpad settings
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerHorizSwipeGesture -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -bool true

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerHorizSwipeGesture -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -bool true

defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

killall SystemUIServer

# Map capslock key to escape
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'

# Finder
# show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# path in title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# column view
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# folders first
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Avoid creating .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Show nothing on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

defaults write com.apple.finder ShowRecentTags -bool false

killall Finder

# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

# Disable startup chime
sudo nvram StartupMute=%01

