-- don't move forward with space (makes using space as leader better)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- personals
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("x", "<leader>p", "\"_dp")
-- vim.keymap.set("i", "jj", "<Esc>")

-- kevin's stuff
--
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- quickfix
-- vim.keymap.set('n', '<leader>qf', '<cmd>TroubleToggle quickfix<cr>',
	-- { desc = '[Q]uick[f]ix' }, { silent = true, noremap = true }
--)
