-- local ok, catppuccin = pcall(require, "catppuccin")
-- if not ok then return end
-- vim.g.catppuccin_flavour = "macchiato"
-- catppuccin.setup()
-- vim.cmd[[colorscheme catppuccin]]
--
vim.cmd[[colorscheme gruvbox]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("plamedi.remap")
require("plamedi.packer")
require("plamedi.set")
