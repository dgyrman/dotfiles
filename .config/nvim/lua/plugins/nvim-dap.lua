return {
    "mfussenegger/nvim-dap",
    enabled = false,
    keys = {
        { "<leader>db",  "<cmd>DapToggleBreakpoint<cr>" },
        { "<leader>dc",  "<cmd>DapContinue<cr>" },
        { "<leader>dr",  "<cmd>DapToggleRepl<cr>" },
        { "<leader>dso", "<cmd>DapStepInto<cr>" },
        { "<leader>dsi", "<cmd>DapStepOut<cr>" },
    }
}
