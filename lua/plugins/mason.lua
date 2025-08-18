return {
	'mason-org/mason-lspconfig.nvim',
	event = { 'BufReadPre', 'InsertEnter' },
	dependencies = {
		{
			'neovim/nvim-lspconfig',
			event = { "VeryLazy" },
		},
		{
			'mason-org/mason.nvim',
			cmd = 'Mason',
			opts = {
				ui = {
					icons = {
						package_installed = '',
						package_pending = '',
						package_uninstalled = '',
					}
				}
			}
		},
	},

	opts = {
		automatic_enable = true,
		ensure_installed = {
			'lua_ls',
			'astro',
			'bashls',
			'clangd',
			'cssls',
			'css_variables',
			'emmet_language_server',
			'gopls',
			'html',
			'htmx',
			'jsonls',
			'postgres_lsp',
			'tailwindcss',
			'templ',
			'vimls',
			'svelte',
		},
	},
}
