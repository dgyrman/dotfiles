local lsp = vim.lsp

lsp.config.superhtml = {
    name = "superhtml",
    cmd = { "superhtml", "lsp" },
}

lsp.enable("superhtml")
