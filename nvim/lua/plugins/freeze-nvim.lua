return {
  "charm-and-friends/freeze.nvim",
  config = function()
    require("freeze").setup({
      command = "freeze",
      open = true, -- Open the generated image after running the command
      show_line_numbers = true,
      shadow = {
        blur = 20,
        x = 0,
        y = 10,
      },
      border = {
        radius = 8,
        width = 1,
        color = "#515151",
      },
      padding = "20",
      window = true,
      output = function()
        return "./" .. os.date("%Y-%m-%d") .. "_freeze.png"
      end,
      theme = "catppuccin-mocha",
    })
  end,
  keys = {
    { "<leader>cp", ":'<,'>Freeze<cr>", mode = "v", desc = "Capture image with freeze" },
  },
}
