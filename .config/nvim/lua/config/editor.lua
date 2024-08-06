local lualine = require("lualine")
local conform = require("conform")
local theme = require("vscode")
local fzf_lua = require("fzf-lua")

require("gitsigns").setup()

fzf_lua.setup({
	winopts = {
		backdrop = 100,
	},
})

theme.setup({})
theme.load()

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettier" } },
		html = { { "prettier" } },
		scss = { { "prettier" } },
		go = { { "gofmt", lsp_format = "fallback" } },
	},
})

lualine.setup({
	options = {
		icons_enabled = false,
		theme = "vscode",
		component_separators = { left = " ", right = " " },
		section_separators = { left = " ", right = " " },
		ignore_focus = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
