return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "leoluz/nvim-dap-go", opts = {} },
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {
                virt_text_pos = "eol",
                commented = true
            }
        },
        {
            "igorlfs/nvim-dap-view",
            config = function()
                local dap = require("dap")
                local dv = require("dap-view")

                -- Setup dap-view with specific options
                dv.setup({
                    winbar = {
                        default_section = "scopes",
                    },
                    windows = {
                        terminal = {
                            -- Hide the terminal window for Go debug sessions (not supported)
                            hide = { "go" },
                        },
                    },
                })

                -- Define convenience functions to open/close the dap-view UI
                local function open() dv.open() end
                local function close() dv.close() end

                -- Automatically open dap-view when debugging starts
                dap.listeners.before.attach["dap-view-config"] = open
                dap.listeners.before.launch["dap-view-config"] = open

                -- Automatically close dap-view when debugging ends
                dap.listeners.before.event_terminated["dap-view-config"] = close
                dap.listeners.before.event_exited["dap-view-config"] = close
            end,
        }
    },
    keys = {
        { "<leader>db",  "<cmd>DapToggleBreakpoint<cr>" },
        { "<leader>dcb", "<cmd>DapClearBreakpoints<cr>" },

        { "<F1>",        "<cmd>DapContinue<cr>" },
        { "<F2>",        "<cmd>DapStepInto<cr>" },
        { "<F3>",        "<cmd>DapStepOut<cr>" },
        { "<F12>",       "<cmd>DapTerminate<cr>" },

        { "<leader>dlb", "<cmd>FzfLua dap_breakpoints<cr>" }
    },
    config = function()
        -- Define the DapStopped sign with above highlights
        vim.fn.sign_define('DapStopped', {
            text = '',
            texthl = 'DiagnosticInfo',
        })

        -- Define other DAP signs with default diagnostic highlights
        vim.fn.sign_define('DapBreakpoint', {
            text = 'B',
            texthl = 'DiagnosticInfo',
        })

        vim.fn.sign_define('DapBreakpointCondition', {
            text = 'C',
            texthl = 'DiagnosticHint',
        })

        vim.fn.sign_define('DapLogPoint', {
            text = 'L',
            texthl = 'DiagnosticInfo',
        })

        vim.fn.sign_define('DapBreakpointRejected', {
            text = 'R',
            texthl = 'DiagnosticError',
        })
    end
}
