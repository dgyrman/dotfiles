return {
    "mfussenegger/nvim-dap",
    enabled = false,
    keys = {
        { "<leader>db",  require('dap').toggle_breakpoint },
        { "<leader>dc",  require('dap').continue },
        { "<leader>dr",  require('dap').repl.open },
        { "<leader>dso", require('dap').step_over },
        { "<leader>dsi", require('dap').step_into },
    }
}
