return {
  "akinsho/bufferline.nvim",
  -- init = function()
  --   local bufline = require("catppuccin.groups.integrations.bufferline")
  --   function bufline.get()
  --     return bufline.get_theme()
  --   end
  -- end,
  keys = {
    { "<leader>bml", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
    { "<leader>bmr", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
    { "<leader>bu", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
  },
  opts = {
    options = {
      separator_style = "slant",
      sort_by = "insert_after_current",
    },
  },
}
