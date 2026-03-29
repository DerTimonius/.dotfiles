return {
  {
    --   TODO: enable gh version when PR is merged
    "mistricky/codesnap.nvim",
    -- dir = "~/Coding/OpenSource/codesnap.nvim",
    keys = {
      { "<leader>cp", ":'<,'>CodeSnap<cr>", mode = "v", desc = "Save selected code snapshot into clipboard" },
    },
    opts = {
      show_line_number = true,
      show_workspace = true,
      snapshot_config = {
        themes_folders = {
          "~/.config/bat/themes/",
        },
        theme = "Catppuccin Mocha",
        code_config = {
          font_family = "MonaspiceAr Nerd Font",
          breadcrumbs = {
            enable = true,
            separator = "/",
          },
        },
        window = {
          margin = {
            x = 64,
            y = 48,
          },
        },
        background = {
          start = {
            x = 0,
            y = 0,
          },
          ["end"] = {
            x = "max",
            y = 0,
          },
          stops = {
            {
              position = 0,
              color = "#8bdeda",
            },
            {
              position = 0.2,
              color = "#43add0",
            },
            {
              position = 0.4,
              color = "#998ee0",
            },
            {
              position = 0.6,
              color = "#e17dc2",
            },
            {
              position = 0.8,
              color = "#ef9393",
            },
          },
        },
      },
    },
  },
}
