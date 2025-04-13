local lsp = vim.lsp

lsp.config.ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    init_options = { hostInfo = 'neovim' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    single_file_support = true,
}

lsp.enable('ts_ls')
