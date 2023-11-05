-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-c>", "Esc")
vim.keymap.set("v", "<C-c>", "Esc")

vim.keymap.set("i", "<C-s>", "<cmd>w<cmd>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line downwards" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted line upwards" })
