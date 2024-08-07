-- Lazy init
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local plugins = {}
-- local opts = {}
--
-- require("lazy").setup(plugins, opts)

vim.g.mapleader = " "
require("lazy").setup("heaven/plugins")
require("heaven.keymap")
require("heaven.settings")
vim.cmd("LushwalCompile")
