vim.g.mapleader = " "

vim.g.have_nerd_font = true

vim.o.autocomplete = true
vim.o.breakindent = true
vim.o.completeopt = "menu,menuone,noselect,popup"
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.guicursor = "n-v-c-i:block"
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.list = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wrap = false

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
