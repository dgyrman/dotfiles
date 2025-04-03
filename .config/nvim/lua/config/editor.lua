local lualine = require("lualine")
local gitsigns = require("gitsigns")
local fzf_lua = require("fzf-lua")
local conform = require("conform")

vim.cmd("colorscheme xcodedarkhc")

-- Iniatiate git signs plugin (Fancy git marks near the line numbers)
gitsigns.setup({
	current_line_blame = true,
})

-- FZF Lua
fzf_lua.setup({
	file_icon_padding = "",
	defaults = {
		async = true,
		git_icons = true,
		file_icons = true,
	},
	winopts = {
		fullscreen = true,
	},
})

-- Fancy bar
lualine.setup({
	options = {
		theme = "auto",
		icons_enabled = false,
		component_separators = { left = " ", right = " " },
		section_separators = { left = " ", right = " " },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "filetype" },
	},
})

-- SETUP CONFORM
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
	},
})
