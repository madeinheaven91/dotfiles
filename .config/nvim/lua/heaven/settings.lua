vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")
vim.cmd("colorscheme lushwal")
vim.opt.fillchars = {
  vert = "▕", -- alternatives │
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}
-- vim.cmd("hi CursorLine term=bold cterm=bold guibg=#2A2B3C")
vim.cmd("set foldmethod=manual")
vim.wo.relativenumber = true

vim.g.lushwal_configuration = {
	color_overrides = function(colors)
		local overrides = {
			color5 = colors.color5,
			color1 = colors.color1,
		}
		return vim.tbl_extend("force", colors, overrides)
	end,
  compile_to_vimscript = true,
  terminal_colors = true,
  addons = {
    barbar = true,
    bufferline_nvim = false,
    dashboard_nvim = true,
    lualine = true,
    mini_nvim = true,
    native_lsp = true,
    neomake = false,
    neotree = true,
    nvim_cmp = true,
    telescope_nvim = true,
    treesitter = true,
  }
}
