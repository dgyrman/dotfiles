local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"css",
		"go",
		"gotmpl",
		"html",
		"javascript",
		"jinja",
		"jinja_inline",
		"jsdoc",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"phpdoc",
		"php_only",
		"python",
		"query",
		"svelte",
		"twig",
		"typoscript",
		"vim",
		"vimdoc",
	},

	sync_install = false,

	auto_install = false,

	highlight = { enable = true },

	indent = { enable = false },
})
