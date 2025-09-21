return {
	setup = function()
		vim.g.mapleader = " "
		local map = vim.keymap.set

		-- general
		map('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Update config" })
		map('n', '<leader>uw', function()
			vim.cmd(":set wrap!")
			vim.notify(
				'Word-wrap ' .. (vim.opt.linebreak:get() and 'enabled' or 'disabled'),
				vim.log.levels.INFO
			)
		end, { desc = "Toggle wrap" })
		map('n', '<leader>s', ':write<CR>', { desc = "Save" })
		map('n', '<S-leader>s', ':wa<CR>', { desc = "Save all" })
		map('n', '<leader>q', ':quit<CR>', { desc = "Quit" })
		map('n', '<leader>bq', ':bd<CR>', { desc = "Delete buffer" })
		map('n', '<leader>bo', ':%bd|e#<CR>', { desc = "Delete all buffers but this" })
		map({ 'n', 'v', 'x' }, '<leader>y', function()
			vim.cmd('normal! "+y')
			vim.notify('Yanked to system clipboard', vim.log.levels.INFO)
		end, { desc = "Yank to sys clipboard" })
		map({ 'n', 'v', 'x' }, '<leader>x', function()
			vim.cmd('normal! "+x')
			vim.notify('Cut to system clipboard', vim.log.levels.INFO)
		end, { desc = "Cut to sys clipboard" })
		map({ 'n', 'v', 'x' }, '<leader>p', '"+p', { desc = "Paste from sys clipboard" })
		map('n', '<leader>t', ':tabnew<CR>', { desc = "New tab" })
		map('n', '<S-Tab>', ':tabprevious<CR>', { desc = "Prev tab" })
		map('n', '<Tab>', ':tabnext<CR>', { desc = "Next tab" })

		-- Picker
		map('n', '<leader>ff', ':Pick files<CR>', { desc = "List files" })
		map('n', '<leader>fb', ':Pick buffers<CR>', { desc = "List buffers" })
		map('n', '<leader>fr', ':Pick oldfiles<CR>', { desc = "List recent" })
		map('n', '<leader>fk', ':Pick keymaps<CR>', { desc = "List keymaps" })
		map('n', '<leader>f"', ':Pick registers<CR>', { desc = "List registers" })
		map('n', '<leader>gb', ':Pick git_branches<CR>', { desc = "List git branches" })
		map('n', '<leader>gc', ':Pick git_commits<CR>', { desc = "List git commits" })
		map('n', '<leader>gf', ':Pick git_files<CR>', { desc = "List git files" })
		map('n', '<leader>gg', ':Pick grep_live<CR>', { desc = "Grep" })
		map('n', '<leader>e', ':Oil<CR>', { desc = "Open explorer" })

		-- LSP
		map('n', 'm', ':Mason<CR>')
		map('n', '<leader>cf', function()
			vim.lsp.buf.code_action({
				context = { only = { 'source.addMissingImports' } },
				apply = true,
			})
			vim.lsp.buf.code_action({
				context = { only = { 'source.organizeImports' } },
				apply = true,
			})
			vim.lsp.buf.format()
		end, { desc = "Format" })
		map("n", "<leader>ct", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
			{ desc = "Toggle inlay hints" })
		map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
		map("n", "<leader>cd", function() vim.diagnostic.open_float({ focusable = true }) end,
			{ desc = "Diagnostics" })
		map("n", "<leader>cs", vim.lsp.buf.document_symbol, { desc = "Symbols" })
		map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
		map("n", "<leader>cR", vim.lsp.buf.references, { desc = "References" })
		map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })

		-- tmux navigation
		map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
		map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
		map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
		map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
		map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
		map("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

		-- To avoid switching between languages
		-- FIXME: doesnt always work. need to find another way
		vim.cmd.set(
			"langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz")
	end
}
