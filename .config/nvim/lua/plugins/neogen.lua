return {
    "danymat/neogen",
    config = true,
    version = "*",
    keys = {
        { "<leader>ds", ":Neogen<CR>" }
    },
    opt = {
        snippet_engine = "luasnip",
        languages = {
            python = {
                template = {
                    annotation_convention = "google_docstrings"
                }
            }
        }
    }
}
