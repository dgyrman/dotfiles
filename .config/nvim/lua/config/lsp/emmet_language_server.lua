local lsp = vim.lsp

lsp.config.emmet_language_server = {
    cmd = { 'emmet-language-server', '--stdio' },
    filetypes = {
        'css',
        'eruby',
        'html',
        'htmldjango',
        'javascriptreact',
        'less',
        'pug',
        'sass',
        'scss',
        'typescriptreact',
        'htmlangular',
    },
    root_markers = { '.git' },
}

lsp.enable("emmet_language_server")
