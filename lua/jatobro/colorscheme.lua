require("vague").setup({
	transparent = true,
	on_highlights = function(hl, _)
		hl.Normal = { bg = "none" }
		hl.NormalNC = { bg = "none" }
		hl.SignColumn = { bg = "none" }
		hl.NormalFloat = { bg = "none" }
		hl.Cursor = { fg = "#141415", bg = "#cdcdcd" }
	end,
})

vim.cmd("colorscheme vague")
