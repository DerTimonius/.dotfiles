return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add file to harpoon",
    },
    {
      "<C-y>",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Toggle harpoon menu",
    },
    {
      "<C-1>",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Select first file in harpoon",
    },
    {
      "<C-2>",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Select second file in harpoon",
    },
    {
      "<C-3>",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Select third file in harpoon",
    },
    {
      "<C-4>",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Select fourth file in harpoon",
    },
  },
}
