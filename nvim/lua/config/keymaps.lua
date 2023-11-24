-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-c>", "Esc")
vim.keymap.set("v", "<C-c>", "Esc")

vim.keymap.set("i", "<C-s>", "<esc><cmd>w<CR>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
