local lsp = vim.lsp

lsp.config.css_ls = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    single_file_support = true,
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}

lsp.enable('css_ls')
