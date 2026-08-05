local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		preview = { treesitter = true },
		color_devicons = true,
		borderchars = {
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
		},
		path_displays = { "smart" },
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
		layout_config = {
			height = 100,
			width = 400,
			preview_cutoff = 40,
		},
	},
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
})

pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
