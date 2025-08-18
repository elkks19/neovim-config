require("config.lazy")
require("config.options")
require("config.lsp")
require("config.keybinds")

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
vim.cmd.colorscheme('rose-pine')

vim.lsp.set_log_level("error")
