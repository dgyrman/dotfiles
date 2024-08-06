local telescope = require("telescope.builtin")
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

-- TELESCOPE
map("n", "<leader>t", telescope.find_files)
map("n", "<leader>ff", telescope.live_grep)
map("n", "<leader>b", telescope.buffers)

-- SEARCH/REPLACE
map("n", "<S-r>", require("fzf-lua").grep)

-- NVIM-DAP (Debugger)
-- Will figure out later
-- map.set("n", "<leader>du", "<cmd>:lua require('dapui').toggle()<cr>", {})
-- map.set("n", "<leader>dc", "<cmd>:lua require('dap').continue()<cr>")
-- map.set("n", "<S-b>", "<cmd>:lua require('dap').toggle_breakpoint()<cr>")
-- map.set("n", "<S-i>", "<cmd>:lua require('dap').step_into()<cr>", {})
-- map.set("n", "<S-o>", "<cmd>:lua require('dap').step_over()<cr>", {})
