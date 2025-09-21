return {
	setup = function()
		vim.pack.add({
			{ src = 'https://github.com/bluz71/vim-moonfly-colors' },
			{ src = 'https://github.com/neovim/nvim-lspconfig' },
			{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
			{ src = 'https://github.com/echasnovski/mini.pick' },
			{ src = 'https://github.com/echasnovski/mini.extra' },
			{ src = 'https://github.com/echasnovski/mini.hipatterns' },
			{ src = 'https://github.com/alexghergh/nvim-tmux-navigation' },
			{ src = 'https://github.com/wakatime/vim-wakatime' },
			{ src = 'https://github.com/stevearc/oil.nvim' },
			{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
			{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
			{ src = 'https://github.com/mason-org/mason.nvim' },
			{ src = 'https://github.com/folke/snacks.nvim' },
			{ src = 'https://github.com/norcalli/nvim-colorizer.lua' },
			{ src = "https://github.com/folke/which-key.nvim" },
			{ src = "https://github.com/goolord/alpha-nvim" },
			{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
		})

		local greeting = [[
   _____                    _    ___
  / ___/      ______ _____ | |  / (_)___ ___
  \__ \ | /| / / __ `/ __ `/ | / / / __ `__ \
 ___/ / |/ |/ / /_/ / /_/ /| |/ / / / / / / /
/____/|__/|__/\__,_/\__, / |___/_/_/ /_/ /_/
                   /____/
						   ]]
		require 'alpha'.setup {
			layout = {
				{ type = "padding", val = vim.fn.floor(vim.fn.winheight(0) * 0.3) },
				{ type = "text",    val = greeting,                                                                                        opts = { position = "center" } },
				{ type = "text",    val = "I'm ambidextrous, I slap ass with both hands\n                                     - Ludacris", opts = { position = "center" } },
			}
		}
		require 'which-key'.setup {
			delay = 300,
			preset = 'helix',
			icons = {
				colors = false,
				mappings = false,
				separator = "-",
				breadcrumb = ">",
			},
		}
		require 'lsp'.setup()
		require 'mason'.setup()
		require 'snacks'.setup {
			bigfile = { enabled = true },
			indent = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
		}
		require('oil').setup {
			columns = { 'icon', 'size', },
			win_options = { signcolumn = 'yes', },
			delete_to_trash = true,
		}
		require 'mini.pick'.setup()
		require 'mini.extra'.setup()
		require 'mini.hipatterns'.setup {
			highlighters = {
				fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
				todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
				note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
				hex_color = require 'mini.hipatterns'.gen_highlighter.hex_color(),
			},
		}
		require 'nvim-tmux-navigation'.setup {
			config = function()
				local nvim_tmux_nav = require('nvim-tmux-navigation')
				nvim_tmux_nav.setup({
					disable_when_zoomed = true,
					keybindings = {
						left = '<C-h>',
						down = '<C-j>',
						up = '<C-k>',
						right = '<C-l>',
						last_active = '<C-\\>',
						next = '<C-Space>',
					},
				})
			end,
		}
	end
}
