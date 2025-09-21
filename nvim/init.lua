-- keymaps
require "keymaps".setup()

-- plugins
require "plugins".setup()

-- general
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.winborder = "single"
vim.o.completeopt = "menu,menuone,preview,popup,noselect"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- colors
vim.cmd('colorscheme moonfly')

local yellow = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("MoonflyYellow")), "fg")
vim.cmd('hi StatusLine guibg=NONE guifg=' .. yellow)
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = 'bg' })
