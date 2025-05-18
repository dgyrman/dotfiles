local opt = vim.opt

-- Enable true color support in the terminal
opt.termguicolors = true


-- Show relative line numbers
opt.relativenumber = true

-- Show the absolute number on the current line
opt.number = true

-- Always show the sign column with a width of 3 (e.g., for git or diagnostics signs)
opt.signcolumn = "yes:3"

-- Always display the last status line (global status line)
opt.laststatus = 3


-- Configure short message behavior to reduce the amount of messages shown
-- 'I' - Disable the intro message
-- 's' - skip search count message
-- 'W' - don't show "written" message
opt.shortmess = "IsW"

-- Use the system clipboard for all operations (copy/paste)
opt.clipboard = "unnamedplus"

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

-- Configure status line
vim.o.statusline = table.concat {
    "%f ",                           -- file name
    "%= %{v:lua.get_git_branch()} ", -- git branch
}

function _G.get_mode()
    local modes = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        c = "COMMAND",
        R = "REPLACE",
        t = "TERMINAL"
    }
    local current_mode = vim.api.nvim_get_mode().mode
    return "[" .. (modes[current_mode] or current_mode) .. "]"
end

function _G.get_git_branch()
    local handle = io.popen("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --abbrev-ref HEAD 2>/dev/null")
    if handle == nil then return "" end
    local branch = handle:read("*a") or ""
    handle:close()
    branch = branch:gsub("\n", "")
    if branch == "" then return "" end
    return branch
end

-- Configure line number in netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
