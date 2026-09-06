require("config.lazy")
require("config.options")
require("config.lsp")
require("config.keybinds")
require("config.commands")

vim.api.nvim_create_autocmd('FileType', {
	pattern = { '<filetype>' },
	callback = function() vim.treesitter.start() end,
})

-- register the templ filetype
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

-- plugin that lets me edit sudo accesible files
vim.g.suda_smart_edit = 1

-- this is so the python provider works
vim.g.python3_host_prog = '/usr/bin/python'
-- and this disables perl provider
vim.g.loaded_perl_provider = 0

-- set colorscheme to rose pine as default
vim.cmd.colorscheme('catppuccin-mocha')

vim.opt['number'] = true

vim.g.pioConfig = {
	lsp = 'clangd',
	debug = true,
	clangd_source = 'compiledb',
}

local pok, platformio = pcall(require, 'platformio')
if pok then platformio.setup(vim.g.pioConfig) end

vim.lsp.config('*', {
	capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- so ejs files work with treesitter and filetype detection
vim.filetype.add({ extension = { ejs = "ejs" } })
vim.treesitter.language.register("html", "ejs")
vim.treesitter.language.register("javascript", "ejs")
vim.treesitter.language.register("embedded_template", "ejs")

vim.o.exrc = true

-- register file extension for go templates so it recognizes tmpl as gotmpl
vim.filetype.add({
	extension = {
		tmpl = "gotmpl",
	},
})
