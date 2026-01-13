return {
  {
    "saghen/blink.cmp",
    enabled = false,
    opts = {
      sources = {
        default = { "lsp", "path", "buffer" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
  },
}
