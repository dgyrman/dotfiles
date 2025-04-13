return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { "stylelua", lsp_format = "fallback" },
            python = { "isort", "black", lsp_format = "fallback" },
            javascript = { "prettier", lsp_format = "fallback" },
            html = { "prettier", lsp_format = "fallback" },
            go = { "goimports", "gofmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
