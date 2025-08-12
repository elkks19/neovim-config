return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'master',
	lazy = false,
	init = function()
		require'nvim-treesitter.configs'.setup {
			highlight = {
				enable = true,
			},
			indent = {
				enable = false,
			},

			modules = {},

			sync_install = false,
			auto_install = false,
			ignore_install = {},

			ensure_installed = {
				-- parsers necesarios para noice
				'vim',
				'vimdoc',
				'regex',
				'lua',
				'bash',
				'markdown',
				'markdown_inline',

				-- cosas de go
				'go',
				'gomod',
				'gosum',
				'gowork',
				'gotmpl',

				-- lenguajes que uso
				'svelte',
				'arduino',
				'sql',
				'make',
				'c',
				'cpp',
				'python',
				'json',
				'tsx',
				'html',
				'css',
				'javascript',
				'typescript',
				'templ',

				'gitignore',
				'printf',
			},
		}
	end,
}
