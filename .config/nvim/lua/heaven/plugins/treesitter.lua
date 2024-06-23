return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {'lua', 'javascript', 'c_sharp', 'css', 'html', 'vue'},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
