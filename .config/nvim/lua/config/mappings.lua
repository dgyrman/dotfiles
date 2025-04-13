local map = vim.keymap.set

map("n", "<leader>e", "<cmd>Ex<cr>")
map("n", "<leader>x", "<cmd>Rex<cr>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<S-w>", ":w<CR>")
map("n", "<S-v>", "_vg_")
map("n", "$", "g_")
map("n", "<S-x>", ":bd<CR>")
map("n", "<C-j>", "mzJ`z")
map("v", "<S-j>", ":m '>+1<CR>gv=gv")
map("v", "<S-k>", ":m '<-2<CR>gv=gv")

map("i", "<C-a>", vim.lsp.completion.get)
map("n", "gl", vim.diagnostic.open_float)
