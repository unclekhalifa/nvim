local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys
keymap('n', '<left>', '<cmd>echo "Use h to move!"<CR>', opts)
keymap('n', '<right>', '<cmd>echo "Use l to move!"<CR>', opts)
keymap('n', '<up>', '<cmd>echo "Use k to move!"<CR>', opts)
keymap('n', '<down>', '<cmd>echo "Use j to move!"<CR>', opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- == Visual == --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
