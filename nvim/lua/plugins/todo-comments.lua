return {
  "folke/todo-comments.nvim",
  keys = {
    {
      "<leader>tdf",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "Show todo comments in Telescope",
    },
    {
      "<leader>tdF",
      function()
        Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
      end,
      desc = "Show todo comments in Telescope (TODO/FIX/FIXME)",
    },
    { "<leader>tdq", "<cmd>TodoQuickFix<CR>", desc = "Show todo comments in quickfix list" },
    { "<leader>tdt", "<cmd>Trouble todo<CR>", desc = "Show todo comments in Trouble list" },
  },
}
