local lsp = vim.lsp

lsp.config.intelephense = {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', '.git' },
    init_options = {
        licenceKey = "/Users/dmytrogyrman/developer/confidential/licences/intelephense.txt",
    },
    settings = {
        intelephense = {
            format = {
                braces = "k&r",
            },
        },
    }
}

lsp.enable('intelephense')
