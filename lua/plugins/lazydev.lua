return {
	-- lazydev is to configure the lua lsp with all stuff needed in neovim
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
      			{ path = "mini.nvim", words = { "MiniPick" } },
			},
		},
	},
}
