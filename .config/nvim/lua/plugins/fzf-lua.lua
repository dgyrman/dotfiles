return {
    "ibhagwan/fzf-lua",
    lazy = false,
    keys = {
        { "<leader>t", "<cmd>FzfLua files<cr>" },
        { "<leader>b", "<cmd>FzfLua buffers<cr>" },
        { "<leader>r", "<cmd>FzfLua grep<cr>" }
    },
    opts = {
        file_icon_padding = "",
        defaults = {
            async = true,
            git_icons = true,
            file_icons = true,
        },
        winopts = {
            fullscreen = true,
        },
    }
}
