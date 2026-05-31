-- Leader Key
vim.g.mapleader = ","
-- Keymaps
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q",vim.cmd.q)
vim.keymap.set("n", "<leader>e",vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)
vim.keymap.set("n", "<leader>k", ":")
-- Disable arrow keys for navigation
-- Normal mode
--vim.keymap.set("n", "<up>", '')
--vim.keymap.set("n", "<down>",'')
--vim.keymap.set("n", "<right>",'')
--vim.keymap.set("n", "<left>", '')

--Telescope
vim.keymap.set("n", "<leader>f", function()
  require('telescope.builtin').find_files({
	    finder = require('telescope.finders').new_fuzzy_file
  })
end)
vim.keymap.set("n", "<leader>a", function()
  require('telescope.builtin').lsp_document_symbols({
	  symbols = 'function'
  })
end)
vim.api.nvim_set_keymap('n', 'q:', '', { noremap = true, silent = true })
