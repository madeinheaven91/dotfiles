return{
  "nvim-neo-tree/neo-tree.nvim",
  name = "neo-tree",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
      },
      window = {
        mappings = {
          ["."] = "toggle_hidden",
          ["="] = "set_root"
        }
      }
    })
  end
}
