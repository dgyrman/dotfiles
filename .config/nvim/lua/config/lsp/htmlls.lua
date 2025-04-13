local lsp = vim.lsp

lsp.config.html_ls = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = {
        "jinja",
        "html",
        "pug",
    },
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { 'html', 'css', 'javascript' },
    },
    single_file_support = true,
}

lsp.enable('html_ls')
