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
	pattern = { "<filetype>" },
  callback = function() vim.treesitter.start() end
})
