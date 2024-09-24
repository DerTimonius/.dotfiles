return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        enabled = false,
      },
      ts_ls = {
        enabled = true,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "literals",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
        keys = {
          {
            "<leader>ci",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.addMissingImports.ts" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Add missing imports",
          },
          {
            "<leader>co",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports.ts" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Organize Imports",
          },
          {
            "<leader>cu",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.removeUnused.ts" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Remove Unused Imports",
          },
          {
            "<leader>cD",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.fixAll.ts" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Fix all diagnostics",
          },
        },
      },
    },
    setup = {
      ts_ls = function()
        return false
      end,
      vtsls = function()
        return true
      end,
    },
  },
}
