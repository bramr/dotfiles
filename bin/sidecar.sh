#!/bin/bash
osascript <<EOF
tell application "System Settings"
    activate
    delay 0.5
    reveal pane id "com.apple.Displays-Settings.extension"
    repeat until window 1 exists
        delay 0.1
    end repeat
    delay 0.5
    tell application "System Events"
        tell first window of application process "System Settings"
            repeat until exists (menu button 1 of group 1 of group 3 of splitter group 1 of group 1)
                delay 0.1
            end repeat
            tell menu button 1 of group 1 of group 3 of splitter group 1 of group 1
                click
                tell menu 1
                    set found to false
                    repeat with aMenuItem in menu items
                        if name of aMenuItem contains "Mirror or Extend to" then
                            set found to true
                        end if
                        if name of aMenuItem contains "iPad" and found then
                            click aMenuItem
                            delay 2
                            exit repeat
                        end if
                    end repeat
                end tell
            end tell
        end tell
    end tell
    quit
end tell
EOF
