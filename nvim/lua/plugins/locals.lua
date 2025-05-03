return {
  {
    dir = "~/Coding/projects/plugins/tailwind-sort.nvim/",
    config = function()
      require("twsort").setup()
    end,
    keys = {
      { "<leader>so", ":'<,'>SortTailwind<CR>", desc = "Sort tailwind classes in highlighted string", mode = "v" },
    },
  },
}
