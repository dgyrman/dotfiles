local lsp = vim.lsp

lsp.config.superhtml = {
    name = "superhtml",
    filetypes = { "html" },
    cmd = { "superhtml", "lsp" },
}

lsp.enable("superhtml")
