local M = {}

-- Carpeta de fotos
local IMAGES_DIR = vim.fn.expand("~/.config/nvim/lua/config/headers/pics")

M.headers = {
	'config.headers.neovim',
	'config.headers.neovim2',
	'config.headers.esnupi',
	'config.headers.pikachu',
}

M.sections = {
	{
		section = "terminal",
		cmd = 'fortune -s | cowsay',
		hl = "header",
		width = 45,
		height = 12,
		ttl = 5,
	},
	{ section = "header" },
	-- TODO: HACER QUE ESTA COSA FUNCIONE CON LA CRONTAB (APARENTEMENTE NO PUEDO COPIAR LA IMAGEN COMO TAL EN UN ARCHIVO POR ALGUNA RAZON)
	-- {
	-- 	section = "terminal",
	-- 	cmd = 'cat ~/.config/nvim/cache/pic',
	-- 	padding = 1,
	-- 	height = 17,
	-- 	width = 60,
	--  	ttl = 30,
	-- },
}

function M.random_header()
	local idx = (vim.loop.hrtime() % #M.headers) + 1
	local name = M.headers[idx]
	local ascii = require(name)
	return ascii
end

function M.random_section()
	local idx = (vim.loop.hrtime() % #M.sections) + 1
	local section = M.sections[idx]
	return section
end

return M



