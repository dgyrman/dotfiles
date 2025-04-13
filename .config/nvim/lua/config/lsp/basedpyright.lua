local lsp = vim.lsp

lsp.config.basedpyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { 'python' },
    root_markers = {'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git'},
    single_file_support = true,
    settings = {
        basedpyright = {
            disableOrganizeImports = true
        },
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'workspace',
          autoImportCompletions = true,
          typeCheckingMode = 'standard'
        },
      },
  }
}

lsp.enable('basedpyright')
