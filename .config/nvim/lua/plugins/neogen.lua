return {
    "danymat/neogen",
    config = true,
    version = "*",
    keys = {
        { "<leader>ds", ":Neogen<CR>" }
    },
    opt = {
        snippet_engine = "nvim",
        languages = {
            python = {
                template = {
                    annotation_convention = "google_docstrings"
                }
            }
        }
    }
}
