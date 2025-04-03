local fzf = require("fzf-lua")
local map = vim.keymap.set

-- OPEN NETRW
map("n", "<leader>e", "<CMD>Ex<CR>")
map("n", "<leader>x", "<CMD>Rex<CR>")

-- VERTICAL NAVIGATION WITH CENTRING
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- EDITING
map("n", "<S-w>", ":w<CR>")
map("n", "<S-v>", "_vg_")
map("n", "$", "g_")
map("n", "<S-x>", ":bd<CR>")
map("n", "<C-j>", "mzJ`z")
map("v", "<S-j>", ":m '>+1<CR>gv=gv")
map("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- TODO-COMMENTS
map("n", "<leader>td", ":TodoFzfLua<CR>")

-- NEOGEN
map("n", "<leader>ds", ":Neogen<CR>")

-- FZF
map("n", "<leader>t", fzf.files)
map("n", "<leader>b", fzf.buffers)

-- SEARCH/REPLACE
map("n", "<S-r>", require("fzf-lua").grep)
