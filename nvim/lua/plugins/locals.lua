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
  {
    dir = "~/Coding/projects/plugins/jsdoc.nvim/",
    config = function()
      require("jsdoc").setup({
        ai_provider = "claude",
        claude = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          model = "claude-sonnet-4-20250514",
        },
      })
    end,
    keys = {
      {
        "<leader>js",
        ":'<,'>JSDocGenerate<CR>",
        desc = "Create a JSDoc style comment for the marked function",
        mode = "v",
      },
    },
  },
}
