require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local ensure_installed = {
	"lua",
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"json",
	"markdown",
	"markdown_inline",
	"bash",
	"python",
	"rust",
	"go",
}

require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
		if vim.tbl_contains(ensure_installed, lang) then
			vim.treesitter.start()
		end
	end,
})
