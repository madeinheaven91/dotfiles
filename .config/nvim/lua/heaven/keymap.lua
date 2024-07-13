vim.g.mapleader = " "

vim.keymap.set("n", "<C-r>", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>rr", "<Cmd>Neotree reveal<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
vim.keymap.set("n", "<leader>tg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
vim.keymap.set("n", "<leader>tr", builtin.oldfiles, {})

local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
vim.keymap.set("n", "<A-Left>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-Right>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
vim.keymap.set("n", "<A-a>", "<Cmd>BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<A-d>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer

-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
