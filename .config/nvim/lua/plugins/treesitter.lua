return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            --general
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "bash",
            "lua",

            -- vanilla webdev
            "html",
            "css",

            -- js
            "javascript",
            "jsdoc",

            -- php
            "php",
            "phpdoc",
            "php_only",
            "twig",
            "typoscript",

            -- python
            "python",
            "jinja",
            "jinja_inline",

            -- golang
            "go",
            "gotmpl",
        },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
