vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/echasnovski/mini.ai",
	"https://github.com/echasnovski/mini.surround",
	"https://github.com/echasnovski/mini.statusline",
	"https://github.com/stevearc/conform.nvim",
})

vim.api.nvim_create_user_command("PackAdd", function(opts)
	vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (PackAdd user/repo)" })
