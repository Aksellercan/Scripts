-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		-- Make background transparent
    	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    	vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    	vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
    	vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
    	vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
    	vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
	    vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
    	vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'none' })
	end
}
