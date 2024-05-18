local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "Atelierdune (dark) (terminal.sexy)"
config.font = wezterm.font_with_fallback({
	{
		family = "Zed Mono",
		weight = "DemiBold",
	},
	{
		family = "JetBrains Mono",
		weight = "DemiBold",
		harfbuzz_features = { "calt", "clig", "liga" },
	},
	{
		family = "Hasklug Nerd Font Mono",
		weight = "DemiBold",
	},
	{
		family = "Cascadia Code PL",
		weight = "DemiBold",
		harfbuzz_features = { "calt", "ss01", "ss20" },
	},
	{
		family = "Hack Nerd Font Mono",
		weight = "Regular",
	},
})
config.font_size = 11
config.dpi = 96.0
config.animation_fps = 60
config.enable_wayland = true

config.window_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.bold_brightens_ansi_colors = true

return config
