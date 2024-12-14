local wezterm = require 'wezterm'		-- Pull in the wezterm API
local config = wezterm.config_builder()		-- This will hold the configuration.

-- This is where you actually apply your config choices
config.color_scheme = 'Catppuccin Macchiato'

config.font = wezterm.font('Hack Nerd Font')
-- config.font = wezterm.font('JetBrains Font')
-- config.font = wezterm.font('HeavyData Nerd Font')
config.font_size = 12

-- config.window_decorations = "RESIZE"
config.window_decorations = "NONE"
config.window_background_opacity = 0.8
config.window_background_gradient = {
  colors = {
    '#0f0c29',
    '#302b63',
    '#24243e',
  },
  orientation = 'Horizontal',			-- 'Horizontal' or 'Vertical'
  interpolation = 'Linear',			-- 'Linear', 'Basis' or 'CatmullRom'
  blend = 'Rgb',				-- 'Rgb', 'LinearRgb', 'Hsv' or 'Oklab'
}

config.window_padding = {
  left = 7,
  right = 7,
  top = 5,
  bottom = 0,
}

config.enable_tab_bar = false
config.audible_bell = "Disabled"
config.max_fps = 120

return config					-- and finally, return the configuration to wezterm