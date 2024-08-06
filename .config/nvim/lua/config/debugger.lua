local dap = require('dap')
local dap_ui = require('dapui')
local dap_go = require('dap-go')

dap_go.setup()

dap.adapters.php = {
	type = 'executable',
	command = 'sh',
	args = { os.getenv('HOME') .. '/.config/nvim/scripts/launch_php_debugger.sh' },
}

dap.configurations.php = {
	{
		name = "CLI Script debugger",
		type = "php",
		request = "launch",
		port = 9003,
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dap_ui.open()
end

dap_ui.setup({
	layouts = {
		{
			size = 10,
			elements = {
				{
					id = "scopes",
					size = 0.50
				},
				{
					id = "breakpoints",
					size = 0.25
				},
				{
					id = "stacks",
					size = 0.25
				},
			},
			position = "bottom"
		}
	}
})
