return {
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
		config = function()
			vim.cmd([[colorscheme melange]])
		end,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "luisiacc/gruvbox-baby" },
}
