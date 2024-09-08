return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
  opts = {
    presets = {
      bottom_search = false,
    },
    routes = {
      {
        filter = {
          event = "notify",
          find = "Request textDocument/inlayHint failed",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "error",
          find = "Could not find config file",
        },
        opts = { skip = true },
      },
    },
  },
}
