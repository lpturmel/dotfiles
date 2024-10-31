local wezterm = require 'wezterm'

local config = wezterm.config_builder()


-- General
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 18

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

-- Colors
config.color_scheme = 'catppuccin-mocha'
config.window_background_opacity = 0.85
config.macos_window_background_blur = 25


return config
