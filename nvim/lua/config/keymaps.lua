-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("i", "<C-c>", "Esc")
set("v", "<C-c>", "Esc")

-- weird remap for Mac reasons...
set("n", "º", "<cmd>m .+1<cr>==", { desc = "Move down" })
set("n", "∆", "<cmd>m .-2<cr>==", { desc = "Move up" })
set("i", "º", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
set("i", "∆", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
set("v", "º", ":m '>+1<cr>gv=gv", { desc = "Move down" })
set("v", "∆", ":m '<-2<cr>gv=gv", { desc = "Move up" })

set("i", "<C-s>", "<esc><cmd>w<CR>")
set("n", "<leader>pv", vim.cmd.Ex)
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("x", "<leader>p", '"_dP')
set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>cs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
