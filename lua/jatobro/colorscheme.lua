require("vague").setup({
	transparent = true,
	on_highlights = function(hl, _)
		hl.Normal = { bg = "none" }
		hl.NormalNC = { bg = "none" }
		hl.SignColumn = { bg = "none" }
		hl.NormalFloat = { bg = "none" }
	end,
})

vim.cmd("colorscheme vague")
