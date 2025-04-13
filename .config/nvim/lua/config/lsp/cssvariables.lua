local lsp = vim.lsp

lsp.config.cssvariables = {
    cmd = { 'css-variables-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    settings = {
        cssVariables = {
            lookupFiles = { '**/*.less', '**/*.scss', '**/*.sass', '**/*.css' },
            blacklistFolders = {
                '**/.cache',
                '**/.DS_Store',
                '**/.git',
                '**/.hg',
                '**/.next',
                '**/.svn',
                '**/bower_components',
                '**/CVS',
                '**/dist',
                '**/node_modules',
                '**/tests',
                '**/tmp',
            },
        },
    }
}

lsp.enable('cssvariables')
