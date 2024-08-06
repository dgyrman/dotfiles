local lsp_zero = require("lsp-zero")
local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")

-- SETUP MASON
require("mason").setup({})

-- SETUP LSP ZERO
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "lpr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
	vim.keymap.set("n", "lrv", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "lgd", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "lgD", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "lsh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { buffer = bufnr })

	-- SET SIGN ICONS
	lsp_zero.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })

	-- CMP CONFIG
	local cmp_action = lsp_zero.cmp_action()
	cmp.setup({
		sources = { { name = "nvim_lsp" }, { name = "path" } },
		formatting = lsp_zero.cmp_format({ details = true }),
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp_action.luasnip_supertab(),
			["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
			["<C-Tab>"] = cmp_action.toggle_completion(),

			-- Make sure to close cmp, when using arrow keys
			["<Down>"] = cmp.mapping(function(fallback)
				cmp.close()
				fallback()
			end, { "i" }),
			["<Up>"] = cmp.mapping(function(fallback)
				cmp.close()
				fallback()
			end, { "i" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
	})
end)

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"intelephense",
		"emmet_ls",
		"tsserver",
		"html",
		"cssls",
		"bashls",
		"htmx",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		bashls = function()
			require("lspconfig").bashls.setup({
				filetypes = { "zsh", "sh" },
				settings = {
					bashIde = {
						globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
					},
				},
			})
		end,

		intelephense = function()
			require("lspconfig").intelephense.setup({
				settings = {
					intelephense = {
						format = {
							braces = "k&r",
						},
					},
				},
			})
		end,
	},
})
