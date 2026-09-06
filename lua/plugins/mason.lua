return {
	'mason-org/mason-lspconfig.nvim',
	event = { 'BufReadPre', 'InsertEnter' },
	dependencies = {
		{
			'mason-org/mason.nvim',
			cmd = 'Mason',
			opts = {
				ui = {
					-- icons = {
					-- 	package_installed = '',
					-- 	package_pending = '',
					-- 	package_uninstalled = '',
					-- }
				},

				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			}
		},
		{
			'neovim/nvim-lspconfig',
			event = { "VeryLazy" },
		},
	},

	opts = {
		automatic_enable = true,
		ensure_installed = {
			'lua_ls',
			'astro',
			'cssls',
			'css_variables',
			'emmet_language_server',
			'gopls',
			'html',
			'tailwindcss',
			'templ',
			'vimls',
			'svelte',
			'vtsls',
			-- 'ts_ls',
		},
	},
}
