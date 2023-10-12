function ColorMyPencils(color)
	-- color = color or "kanagawa-wave"
	-- color = color or "catppuccin"
	color = color or "colibri"
    -- color = color or "nord"
    -- color = color or "darcula"
    -- color = color or "shades_of_purple"
    -- color = color or "darcula-solid"
	-- color = color or "gruvbox"
	-- color = color or "gruvbox-material"
	-- color = color or "rose-pine"
	-- color = color or "sunbather"
	-- color = color or "yami"
	-- color = color or "catppuccin-latte"
    -- color = color or "tokyonight"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
