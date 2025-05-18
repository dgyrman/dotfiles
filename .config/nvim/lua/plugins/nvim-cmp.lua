return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end,
                ["<S-Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end,
                ["<C-Tab>"] = function()
                    if cmp.visible() then
                        cmp.close()
                    else
                        cmp.complete()
                    end
                end,
                ["<Down>"] = cmp.mapping(function(fallback)
                    cmp.close()
                    fallback()
                end, { "i" }),
                ["<Up>"] = cmp.mapping(function(fallback)
                    cmp.close()
                    fallback()
                end, { "i" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = function(entry, vim_item)
                    -- Replace this with your own formatting logic if desired
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        path = "[Path]",
                        luasnip = "[Snippet]",
                        nvim_lsp_signature_help = "[Sig]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
        })
    end,
}
