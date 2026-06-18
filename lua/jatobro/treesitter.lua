require("nvim-treesitter").setup({
	ensure_installed = {
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
	},
	auto_install = true,
})
