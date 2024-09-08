local M = {}

function M.create_floating_window()
  local width = vim.o.columns - 4
  local height = vim.o.lines - 4
  local buf = vim.api.nvim_create_buf(false, true)
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = 1,
    row = 1,
    anchor = "NW",
    style = "minimal",
    border = "rounded",
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  return buf, win
end

function M.run_taskwarrior_kanban()
  local buf, win = M.create_floating_window()
  vim.fn.termopen("twkb", {
    on_exit = function()
      vim.api.nvim_win_close(win, true)
    end,
  })

  vim.api.nvim_buf_set_option(buf, "modifiable", false)

  vim.cmd("startinsert")

  vim.api.nvim_buf_set_keymap(buf, "t", "<C-q>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true })
end

vim.api.nvim_create_user_command("Twkb", M.run_taskwarrior_kanban, {})
vim.keymap.set("n", "<leader>tw", "<cmd>Twkb<CR>", { desc = "Open twkb" })

return M
