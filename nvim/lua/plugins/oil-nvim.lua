return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      colums = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in floating window" })
  end,
}
