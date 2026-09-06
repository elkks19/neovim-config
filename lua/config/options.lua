vim.g.mapleader = " "

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- tabs and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false
vim.o.autoindent = true

vim.o.wrap = false
vim.o.swapfile = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.signcolumn = 'yes'

vim.o.backspace = 'indent,eol,start'
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.iskeyword:append { "-" }

vim.g.clipboard = {
	name = "dms-clipboard",
	copy = {
		["+"] = { "dms", "cl", "copy" },
		["*"] = { "dms", "cl", "copy" },
	},
	paste = {
		["+"] = { "dms", "cl", "paste" },
		["*"] = { "dms", "cl", "paste" },
	},
	cache_enabled = 0,
}

vim.opt.clipboard = "unnamedplus"
