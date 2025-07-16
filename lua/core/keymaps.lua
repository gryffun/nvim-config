-- core/keymaps.lua
local keymap = vim.keymap.set
local harpoon = require("harpoon")
-- Space as leader key
vim.g.mapleader = " "

keymap("i", "<C-BS>", "C-w", {noremap=true})
keymap({"i", "v", "c"}, "<A-q>", "<ESC>")
keymap("n", "<leader>w", ":w<CR>")     -- save file
keymap("n", "<leader>qq", ":q<CR>")     -- quit
keymap({"n", "v"}, "<A-j>", "5j")
keymap({"n", "v"}, "<A-k>", "5k")
keymap("n", "<cr>", "o<Esc>")
keymap("n", "<C-cr>", "O<Esc>")
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- search file for word
keymap('n', '<leader>fr', "<cmd>Telescope lsp_references<cr>")
keymap("n", "<leader><C-f>", "<cmd>NvimTreeOpen<cr>")
keymap("n", "<leader><C-x>", "<cmd>NvimTreeClose<cr>")
keymap("n", "<leader><C-t>", "<cmd>tabnew<cr>")
keymap({"n", "v"}, "<A-h>", "0", { noremap = true, silent = true })
keymap({"n", "v"}, "<A-l>", "$", { noremap = true, silent = true })
keymap("n", "<leader>n", "<cmd>noh<cr>")

-- For easier text wrapping
local wrap = require('tenaille').wrap
keymap('v', '"', function() wrap({ '"', '"' }) end)
keymap('v', "'", function() wrap({ "'", "'" }) end)
keymap('v', '`', function() wrap({ '`', '`' }) end)
keymap('v', '(', function() wrap({ '(', ')' }) end)
keymap('v', '[', function() wrap({ '[', ']' }) end)
keymap('v', '{', function() wrap({ '{', '}' }) end)
keymap('v', '<', function() wrap({ '<', '>' }) end)

-- Replace symbol in file
keymap('n', '<Leader>r', function()
  local word = vim.fn.expand('<cword>')
  local repl = vim.fn.input('Replace "'..word..'" with: ')
  word = vim.fn.escape(word, '\\/')
  repl = vim.fn.escape(repl, '\\/')
  vim.cmd("normal! mz")  -- mark current position
  vim.cmd(string.format('%%s/\\V\\<%s\\>/%s/g', word, repl))
  vim.cmd("normal! `z") -- jump back to mark
end, { noremap=true, silent=true })


-- Harpoon keymaps
keymap("n", "<leader>a", function() harpoon:list():add() end)
keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

keymap("n", "<A-1>", function() harpoon:list():select(1) end)
keymap("n", "<A-2>", function() harpoon:list():select(2) end)
keymap("n", "<A-3>", function() harpoon:list():select(3) end)
keymap("n", "<A-4>", function() harpoon:list():select(4) end)
keymap("n", "<A-5>", function() harpoon:list():select(5) end)

-- Toggle previous & next buffers stored within Harpoon list
keymap("n", "<C-S-P>", function() harpoon:list():prev() end)
keymap("n", "<C-S-N>", function() harpoon:list():next() end)

