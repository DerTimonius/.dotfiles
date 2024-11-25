return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      color_overrides = {
        mocha = {
          base = "#101021",
          mantle = "#131324",
          crust = "#0b0b1c",
        },
      },
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.25,
      },
      flavour = "mocha",
      term_colors = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
