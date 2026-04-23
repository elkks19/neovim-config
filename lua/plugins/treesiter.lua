return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	lazy = false,
	init = function()
		local ensure_installed = {
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
		}
		require('nvim-treesitter').install(ensure_installed)


		vim.api.nvim_create_autocmd('FileType', {
			callback = function()
				-- Enable treesitter highlighting and disable regex syntax
				pcall(vim.treesitter.start)
				-- -- Folds
				-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				-- vim.wo[0][0].foldmethod = 'expr'
				-- Enable treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
