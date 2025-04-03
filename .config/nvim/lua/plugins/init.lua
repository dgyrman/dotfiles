return {
	-- FANCY STUFF
	{ "lewis6991/gitsigns.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	{ "arzg/vim-colors-xcode" },

	-- EDITOR
	{ "RRethy/vim-illuminate" },
	{ "danymat/neogen", config = true, version = "*" },
	{ "stevearc/conform.nvim", opts = {} },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "ibhagwan/fzf-lua", lazy = false },

	-- LSP STUFF
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-path" },
	{ "L3MON4D3/LuaSnip" },
}
