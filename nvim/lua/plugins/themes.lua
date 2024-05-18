return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
	{ "savq/melange-nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "maxmx03/solarized.nvim" },
	{ "luisiacc/gruvbox-baby" },
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},
}
