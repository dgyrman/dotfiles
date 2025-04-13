return {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('vscode').setup({
            italic_comments = true,
            underline_links = true
        })

        vim.cmd([[colorscheme vscode]])
    end,
}
