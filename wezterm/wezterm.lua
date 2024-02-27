local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Campbell (Gogh)'
config.font = wezterm.font_with_fallback {
	{
		family = 'Hasklug Nerd Font Mono',
		weight = 'Regular',
	},
	{
		family = 'Hack Nerd Font Mono',
		weight = 'Regular'
	},
	{
		family = 'JetBrains Mono',
		weight = 'DemiBold',
		harfbuzz = {'calt', 'clig', 'liga'},
	},
}
config.font_size = 12
config.dpi = 96.0
config.animation_fps = 60
config.enable_wayland = true

return config
