local opt = vim.opt

-- SET LEADER KEY
vim.g.mapleader = " "

-- CONFIGURE EDITOR
opt.termguicolors = true

opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes:3"

opt.fillchars = { eob = " " }
opt.laststatus = 3

opt.shortmess = "IsW"
opt.clipboard = "unnamed"
opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.softtabstop = 4
opt.shiftwidth = 4

opt.undodir = os.getenv("HOME") .. "/.neovim_undodir"
opt.undofile = true
