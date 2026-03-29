return {
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    keys = {
      { "<leader>gha", ":CodeDiff<cr>", mode = "n", desc = "Show code diff in split view" },
    },
  },
}
