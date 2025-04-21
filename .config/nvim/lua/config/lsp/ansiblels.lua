local lsp = vim.lsp

lsp.config.ansiblels = {
    cmd = { 'ansible-language-server', '--stdio' },
    settings = {
        ansible = {
            python = {
                interpreterPath = 'python',
            },
            ansible = {
                path = 'ansible',
            },
            executionEnvironment = {
                enabled = false,
            },
            validation = {
                enabled = true,
                lint = {
                    enabled = true,
                    path = 'ansible-lint',
                },
            },
        },
    },
    filetypes = { 'yaml' },
    root_markers = { 'inventory.ini' },
}

lsp.enable('ansiblels')
