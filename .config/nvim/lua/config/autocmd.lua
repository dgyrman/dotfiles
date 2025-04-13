local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Enable built-in autotrigger (for servers that support it)
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

        -- inlay hints
        if client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})

-- Setting right filetype for typoscript (annoying TYPO3 script language)
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.{typoscript}", "*.{tsconfig}" },
    callback = function()
        vim.bo.filetype = "typoscript"
    end,
})
