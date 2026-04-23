return {
	{
		'saghen/blink.compat',
		version = '2.*',
		lazy = false,
		opts = {},
	},
	{
		-- enabled = false,
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = { 'rafamadriz/friendly-snippets' },

		enabled = true,
		-- NOTE: BLINK OPTS
		opts_extend = { "sources.default" },
		opts = {
			keymap = {
				preset = 'default',
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<Tab>'] = { 'accept', 'snippet_forward', 'fallback' },
				['<S-Tab>'] = { 'accept', 'snippet_backward', 'fallback' },

				['<C-l>'] = { 'show_documentation', 'fallback' },
				['<C-c>'] = { 'hide_documentation', 'fallback' },
				['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
				['<C-Space>'] = { 'show', 'fallback' },
			},

			appearance = {
				nerd_font_variant = 'mono'
			},

			cmdline = {
				keymap = { preset = 'inherit' },
				completion = { menu = { auto_show = true } },
			},

			signature = { enabled = true },
			completion = {
				trigger = {
					show_on_insert = true,
				},
				keyword = { range = 'prefix' },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				menu = {
					auto_show = true,
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					}
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },

				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
					html = { inherit_defaults = true, "datastar" },
					templ = { inherit_defaults = true, "datastar" },
					php = { inherit_defaults = true, "laravel" },
					blade = { inherit_defaults = true, "laravel" },
				},

				providers = {
					lsp = {
						name = "lsp",
						module = "blink.cmp.sources.lsp",
						score_offset = 1200,
						fallbacks = {},
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 1300,
					},

					laravel = {
						name = "laravel",
						module = "blink.compat.source",
						score_offset = 1300,
					},

					datastar = {
						name = "datastar",
						module = "datastar.cmp_source",
						score_offset = 1300,
					},

					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
						score_offset = 1300,
					},
					snippets = {
						opts = { friendly_snippets = true, },
						score_offset = 1100,
					},
				},
			},


			fuzzy = { implementation = "prefer_rust" },
		},
	},
}
