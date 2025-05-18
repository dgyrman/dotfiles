return {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local colors = require('vscode.colors').get_colors()

        require('vscode').setup({
            italic_comments = true,
            underline_links = true,
            terminal_colors = true,
            group_overrides = {
                EndOfBuffer = { fg = colors.vscLineNumber },
            }
        })

        vim.cmd([[colorscheme vscode]])
    end,
}
