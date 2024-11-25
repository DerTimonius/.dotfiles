-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local del = vim.keymap.del

set("i", "<C-c>", "Esc")
set("v", "<C-c>", "Esc")
vim.cmd.cabbrev("W", "w")

-- weird remap for Mac reasons...
set("n", "º", "<cmd>m .+1<cr>==", { desc = "Move down" })
set("n", "∆", "<cmd>m .-2<cr>==", { desc = "Move up" })
set("i", "º", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
set("i", "∆", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
set("v", "º", ":m '>+1<cr>gv=gv", { desc = "Move down" })
set("v", "∆", ":m '<-2<cr>gv=gv", { desc = "Move up" })

set("i", "<C-s>", "<esc><cmd>w<CR>")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("x", "<leader>p", '"_dP', { desc = "Paste and put selection in void register" })
set("x", "<leader>d", '"_dd', { desc = "Delete selection to void register" })
set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set(
  "n",
  "<leader>cs",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left>]],
  { desc = "Rename word under the cursor (and every instance)" }
)
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- lsp restart keymaps
set("n", "<leader>ts", "<cmd>LspRestart ts_ls<CR>", { desc = "Restart tsserver" })
set("n", "<leader>es", "<cmd>LspRestart eslint-lsp<CR>", { desc = "Restart ESLint" })

set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy GUI" })
set("n", "<leader>lx", "<cmd>LazyExtras<CR>", { desc = "Open LazyExtras" })
set("n", "<leader>nn", "<cmd>Noice<CR>", { desc = "Open Noice history" })

-- delete some keymaps
del("n", "<leader>l")
del("n", "<leader>ft")
del("n", "<leader>fT")
