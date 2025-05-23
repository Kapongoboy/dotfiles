local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Rebecca (base16)"
config.font = wezterm.font_with_fallback({
	{
		family = "FiraMono Nerd Font",
    weight = "Medium",
		harfbuzz_features = { "calt", "clig", "liga" },
	},
	{
		family = "Hack Nerd Font Mono",
	},
	{
		family = "JetBrains Mono",
		weight = "DemiBold",
		harfbuzz_features = { "calt", "clig", "liga" },
	},
	{
		family = "IosevkaTerm Nerd Font Mono",
		weight = "DemiBold",
	},
	{
		family = "Cascadia Code PL",
		weight = "DemiBold",
		harfbuzz_features = { "calt", "ss01", "ss20" },
	},
})
config.font_size = 11
config.dpi = 96.0
config.animation_fps = 120
config.enable_wayland = true

config.window_background_opacity = 0.85
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.bold_brightens_ansi_colors = true

return config
