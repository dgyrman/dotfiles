local lsp = vim.lsp

lsp.config.emmet_ls = {
    cmd = { "emmet-language-server", "--stdio" },
    init_options = {
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
    },
}

lsp.enable('emmet_ls')
