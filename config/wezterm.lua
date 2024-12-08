local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 16
config.color_scheme = 'tokyonight'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.93
config.macos_window_background_blur = 10
config.scrollback_lines = 100000
config.max_fps = 120

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 2000}
config.keys = {
  { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }},
  { key = "=", mods = "LEADER", action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
  { key = ",", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1)},
  { key = ".", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1)},
  { key = "h", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
  { key = "j", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
  { key = "k", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
  { key = "l", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
  { key = "H", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
  { key = "J", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
  { key = "K", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
  { key = "L", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
}

return config
