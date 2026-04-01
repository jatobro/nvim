vim.o.breakindent = true
vim.o.cursorline = true
vim.o.guicursor = "n-v-c-i:block"
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wrap = false

vim.schedule(function() vim.o.clipboard = "unnamedplus" end)

vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/aznhe21/actions-preview.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/kdheepak/lazygit.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	"https://github.com/L3MON4D3/LuaSnip"
})

require("telescope").setup({
	defualts = {
		preview = { treesitter = true },
		color_devicons = true,
		sorting_strategy = "ascending",
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
		layout_config = {
			height = 100,
			width = 400,
			prompt_position = "top",
			preview_cutoff = 40,
		}
	}
})

require("actions-preview").setup({
	backend = { "telescope" },
	extensions = { "env" },
	telescope = vim.tbl_extend(
		"force",
		require("telescope.themes").get_dropdown(), {}
	)
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" },
})

vim.lsp.enable({ "lua_ls", "rust_analyzer", "ruff", "pyright", "tailwindcss", "ts_ls" })

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<Cmd>update<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>:quit<CR>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file tree" })
vim.keymap.set("n", "<leader>lg", vim.cmd.LazyGit, { desc = "Lazy Git" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

vim.keymap.set("n", "<leader>sa", require("actions-preview").code_actions)

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function() vim.hl.on_yank() end,
})

vim.cmd("colorscheme vague")
