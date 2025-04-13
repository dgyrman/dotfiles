return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = 'vscode',
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
    }
}
