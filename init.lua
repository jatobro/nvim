vim.o.autocomplete = true
vim.o.breakindent = true
vim.o.cmdheight = 2
vim.o.completeopt = "menu,menuone,noselect,popup"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.guicursor = "n-v-c-i:block"
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wrap = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/aznhe21/actions-preview.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
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
		},
	},
})

require("actions-preview").setup({
	backend = { "telescope" },
	extensions = { "env" },
	telescope = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {}),
})

require("mason").setup()

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-completion", { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local client = vim.lsp.get_client_by_id(client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client_id, args.buf, {
				autotrigger = true,
			})
		end
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
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

vim.cmd("colorscheme vague")
