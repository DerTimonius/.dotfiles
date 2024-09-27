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
      integrations = {
        cmp = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "yorumicolors/yorumi.nvim",
  },
  { "diegoulloao/neofusion.nvim" },
  {
    "olivercederborg/poimandres.nvim",
    config = function()
      local p = require("poimandres.palette")
      require("poimandres").setup({
        highlight_groups = {
          LspReferenceText = { bg = p.background1 },
          LspReferenceRead = { bg = p.background1 },
          LspReferenceWrite = { bg = p.background1 },
        },
      })
    end,
  },
  {
    "zaldih/themery.nvim",
    lazy = true,
    config = function()
      require("themery").setup({
        livePreview = true,
        themes = { "catppuccin", "yorumi", "neofusion", "poimandres", "tokyonight" },
      })
    end,
    keys = {
      { "<leader>tt", "<cmd>Themery<CR>", desc = "Open theme switcher" },
      {
        "<leader>tc",
        function()
          local themery = require("themery")
          themery.setThemeByName("catppuccin", true)
        end,
        desc = "Switch theme to catppuccin",
      },
      {
        "<leader>ty",
        function()
          local themery = require("themery")
          themery.setThemeByName("yorumi", true)
        end,
        desc = "Switch theme to yorumi",
      },
      {
        "<leader>tn",
        function()
          local themery = require("themery")
          themery.setThemeByName("neofusion", true)
        end,
        desc = "Switch theme to neofusion",
      },
      {
        "<leader>tp",
        function()
          local themery = require("themery")
          themery.setThemeByName("poimandres", true)
        end,
        desc = "Switch theme to poimandres",
      },
    },
  },
}
