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

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<Cmd>update<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>:quit<CR>")
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function() vim.hl.on_yank() end,
})

vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter"
})

vim.lsp.enable({ "lua_ls", "rust_analyzer" })

vim.cmd("colorscheme vague")
