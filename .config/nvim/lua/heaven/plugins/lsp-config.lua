return{
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        settings = {
          documentFormatting = false;
        }
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup{
        capabilities = capabilities
      }
      lspconfig.vuels.setup {
        on_attach = function(client)
            --[[
                Internal Vetur formatting is not supported out of the box

                This line below is required if you:
                    - want to format using Nvim's native `vim.lsp.buf.formatting**()`
                    - want to use Vetur's formatting config instead, e.g, settings.vetur.format {...}
            --]]
            client.resolved_capabilities.document_formatting = true
            on_attach(client)
        end,
        capabilities = capabilities,
        settings = {
            vetur = {
                completion = {
                    autoImport = true,
                    useScaffoldSnippets = true
                },
                format = {
                    defaultFormatter = {
                        html = "none",
                        js = "prettier",
                        ts = "prettier",
                    }
                },
                validation = {
                    template = true,
                    script = true,
                    style = true,
                    templateProps = true,
                    interpolation = true
                },
                experimental = {
                    templateInterpolationService = true
                }
            }
        },
    }
    end
  }
}
