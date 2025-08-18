return {
	-- lazydev is to configure the lua lsp with all stuff needed in neovim
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- the completion engine
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			-- sources
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-emoji',
			'SergioRibera/cmp-dotenv',

			-- snippet engine
			{
				'L3MON4D3/LuaSnip',
				event = "InsertEnter",
				version = "v2.*",
				dependencies = { 'rafamadriz/friendly-snippets' }
			},
			-- source for the snippet engine
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				-- NOTE this disables cmp when in a comment
				enabled = function()
					local disabled = false
					disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
					disabled = disabled or (vim.fn.reg_recording() ~= '')
					disabled = disabled or (vim.fn.reg_executing() ~= '')
					disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
					return not disabled
				end,

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				cmdline = {
					mapping = cmp.mapping.preset.cmdline(),
				},

				completion = {
					completeopt = 'menu,menuone,preview,noselect',
				},

				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = 'select' }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = 'select' }),
					["<C-e>"] = cmp.mapping.abort(),
					['<Tab>'] = cmp.mapping.confirm({ select = true }),
					-- NOTE ?
					-- ["<C-Space>"] = cmp.mapping.complete(),

					["<C-p>"] = cmp.mapping.scroll_docs(-4),
					["<C-n>"] = cmp.mapping.scroll_docs(4),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = 'emoji' },
					{ name = "dotenv" },
				}),
			})
		end
	},
	--
	-- Cmdline: carga SÓLO cuando entres al cmdline
	{
		"hrsh7th/cmp-cmdline",
		event = { "CmdlineEnter" },
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local cmp = require("cmp")
			-- ':' cmdline
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, {
					{ name = "cmdline", option = { ignore_cmds = { "Man", "!" } } }
				}),
			})
			-- '/' cmdline
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})
		end,
	},
}
