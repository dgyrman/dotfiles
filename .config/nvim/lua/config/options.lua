local opt = vim.opt

-- Enable true color support in the terminal
opt.termguicolors = true


-- Show relative line numbers
opt.relativenumber = true

-- Show the absolute number on the current line
opt.number = true

-- Always show the sign column with a width of 3 (e.g., for git or diagnostics signs)
opt.signcolumn = "yes:3"

-- Draw a vertical line at the 100th column (useful for line length indication)
opt.colorcolumn = "100"

-- Always display the last status line (global status line)
opt.laststatus = 3


-- Configure short message behavior to reduce the amount of messages shown
-- 'I' - Disable the intro message
-- 's' - skip search count message
-- 'W' - don't show "written" message
opt.shortmess = "IsW"

-- Use the system clipboard for all operations (copy/paste)
opt.clipboard = "unnamed"

-- Disable line wrapping
opt.wrap = false


-- Disable highlight on search after searching
opt.hlsearch = false

-- Enable incremental search (show matches as you type)
opt.incsearch = true


-- Number of visual spaces that a <Tab> counts for
opt.tabstop = 4

-- Number of spaces to use for each step of (auto)indent
opt.shiftwidth = 4

-- Number of spaces a <Tab> counts for while editing (e.g., inserting/deleting)
opt.softtabstop = 4

-- Convert tabs to spaces
opt.expandtab = true

-- Enable persistent undo so that undo history is saved across sessions
opt.undofile = true


-- Configure completion behavior:
-- 'menu' - show completion menu,
-- 'menuone' - show menu even if only one match,
-- 'noselect' - don't auto-select a match,
-- 'noinsert' - don't insert text until selection is confirmed
opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }

-- Append 'c' to shortmess to avoid showing the completion message in the command line
opt.shortmess:append('c')


-- Configure how diagnostics are displayed
vim.diagnostic.config({
    -- Show diagnostics as virtual text inline with code
    virtual_text = true,

    -- Customize the diagnostic sign symbols for each severity level
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
})
