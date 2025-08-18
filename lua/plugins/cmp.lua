return {
	{
		-- enabled = false,
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},

		enabled = false,
		-- NOTE: BLINK OPTS
		opts = {
			keymap = {
				preset = 'default',
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },
				['<C-e>'] = { 'cancel', 'fallback' },
				['<Tab>'] = { 'accept', 'fallback' },

				['<C-l>'] = { 'show_documentation', 'fallback' },
				['<C-c>'] = { 'hide_documentation', 'fallback' },
				['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-n>'] = { 'scroll_documentation_down', 'fallback' },

				-- ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
			},

			appearance = {
				nerd_font_variant = 'mono'
			},

			completion = {
				documentation = { auto_show = false },
				menu = {
					auto_show = true,
					draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } },
				},
				list = {
					selection = { preselect = false, auto_insert = false }
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
				},

				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},

				snippets = {
					opts = {
						friendly_snippets = true,
						clipboard_register = '+',
					}
				}
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}
