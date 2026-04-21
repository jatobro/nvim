vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("telescope-prompt-options", { clear = true }),
	pattern = "TelescopePrompt",
	callback = function()
		vim.opt_local.autocomplete = false
		vim.opt_local.completeopt = { "noselect" }
	end,
})
