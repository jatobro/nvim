vim.o.breakindent = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.wrap = false

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<Cmd>update<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>:quit<CR>")
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })

vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/neovim/nvim-lspconfig"
})

require("vague").setup {
	italic = false
}

vim.lsp.enable({ "lua_ls" })

vim.cmd("colorscheme vague")
