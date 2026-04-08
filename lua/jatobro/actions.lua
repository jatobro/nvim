require("actions-preview").setup({
	backend = { "telescope" },
	extensions = { "env" },
	telescope = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {}),
})

vim.keymap.set("n", "<leader>sa", require("actions-preview").code_actions)
