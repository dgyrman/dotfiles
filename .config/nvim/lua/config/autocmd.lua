local autocmd = vim.api.nvim_create_autocmd

-- Enabling write on save
autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Setting right filetype for typoscript (annoying TYPO3 script language)
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.{typoscript}", "*.{tsconfig}" },
	callback = function()
		vim.bo.filetype = "typoscript"
	end,
})

-- Setting right colorcolumn for python
vim.api.nvim_create_augroup("python_colorcolumn", { clear = true })
autocmd("FileType", {
	group = "python_colorcolumn",
	pattern = "python",
	callback = function()
		vim.opt.colorcolumn = "100"
	end,
})

-- Fixes somehow annoying jump when tab key is pressed
autocmd("ModeChanged", {
	pattern = "*",
	callback = function()
		if
			((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
			and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
})
