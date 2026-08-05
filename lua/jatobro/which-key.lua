require("which-key").setup({
	delay = 0,
	spec = {
		{ "<leader>f", group = "[F]ind", mode = { "n", "v" } },
		{ "<leader>t", group = "[T]oggle" },
		{ "gr", group = "LSP Actions", mode = { "n" } },
	},
})
