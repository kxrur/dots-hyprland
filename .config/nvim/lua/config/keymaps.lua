-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = LazyVim.safe_keymap_set

-- disable arrow keys in insert mode (renaming files annoying)
-- map("i", "<Up>", "<NOP>", { desc = "" })
-- map("i", "<Down>", "<NOP>", { desc = "" })
-- map("i", "<Left>", "<NOP>", { desc = "" })
-- map("i", "<Right>", "<NOP>", { desc = "" })
