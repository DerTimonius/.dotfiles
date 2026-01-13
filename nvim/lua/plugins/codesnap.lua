return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>cp", ":'<,'>CodeSnap<cr>", mode = "v", desc = "Save selected code snapshot into clipboard" },
    },
    opts = {
      code_font_family = "MonaspiceAr Nerd Font",
      has_breadcrumbs = true,
      has_line_number = true,
      bg_theme = "sea",
      bg_x_padding = 64,
      bg_y_padding = 48,
      watermark = "",
    },
  },
}
