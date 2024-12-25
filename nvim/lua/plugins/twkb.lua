return {
  {
    "DerTimonius/twkb.nvim",
    config = function()
      require("twkb").setup()
    end,
    keys = {

      { "<leader>tw", "<cmd>Twkb<CR>", desc = "Open twkb" },
    },
  },
}
