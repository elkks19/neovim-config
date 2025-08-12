return {
	'echasnovski/mini.pick',
	version = '*',
  	cmd = { 'Pick' },
	keys = {
		-- TODO: HACER EL PICKER PARA LAS COMMITS DE GIT Y ABRRILO EN NEOTREE
		-- https://github.com/nvim-neo-tree/neo-tree.nvim
		-- https://github.com/echasnovski/mini.pick?tab=readme-ov-file#how-to-start-a-picker
		{
			"<leader>cs",
			function()
				vim.api.nvim_exec_autocmds("User", { pattern = "PickColors" })

				MiniPick.start({
					source = {
						name = "Colorschemes",
						items = function() return vim.fn.getcompletion("", "color") end,
						choose = function(name)
							if name and name ~= "" then vim.cmd.colorscheme(name) end
						end,
					},
				})
			end,
			desc = "change colorscheme",
		},
		{
			"<leader>gf",
			function()
				MiniPick.start({
					source = {
						name = "GitignoredFiles",
						items = function()
							return MiniPick.set_picker_items_from_cli({
								'fd',
								'--unrestricted',
								'--type=f',
								'--no-follow',
								'--color=never',
								'--exclude=.git',
							})
						end
					}
				})
			end,
			desc = "search for files including gitignored and hidden files"
		},
		{ "<leader>ff", "<cmd>Pick files<cr>", desc = "search for files" },
		{ "<leader>fs", "<cmd>Pick grep_live<cr>", desc = "search for content in files" },
		{ "<leader>fb", "<cmd>Pick buffers<cr>", desc = "search for buffers" },
		{ "<leader>he", "<cmd>Pick help<cr>", desc = "search for a help page" },
		{ "<leader>hi", "<cmd>Pick history<cr>", desc = "search for a command in history" },
		{ "<leader>fd", "<cmd>Pick diagnostic<cr>", desc = "search for lsp diagnostics" },
		{ "<leader>fc", "<cmd>Pick command<cr>", desc = "search for commands" },
		{ "<leader>fe", "<cmd>Pick explorer<cr>", desc = "file explorer in pick" },
		{ "<leader>ft", "<cmd>Pick hipatterns<cr>", desc = "search for hipatterns" },
		{ "<leader>gb", "<cmd>Pick git_branches<cr>", desc = "select git branches" },
	},
	opts ={
		mappings = {
			caret_left  = '<Left>',
			caret_right = '<Right>',

			choose            = '<CR>',
			choose_in_split   = '<C-h>',
			choose_in_tabpage = '<C-M-t>',
			choose_in_vsplit  = '<C-v>',
			choose_marked     = '<C-CR>',

			delete_char       = '<BS>',
			delete_char_right = '<Del>',
			delete_left       = '<C-S-BS>',
			delete_word       = '<C-BS>',

			mark     = '<C-x>',
			mark_all = '<C-a>',

			move_down  = '<C-j>',
			move_start = '<C-g>',
			move_up    = '<C-k>',

			paste = '<C-r>',

			refine        = '<C-Space>',
			refine_marked = '<M-Space>',

			scroll_down  = '<C-e>',
			scroll_left  = '<C-h>',
			scroll_right = '<C-l>',
			scroll_up    = '<C-y>',

			stop = '<C-c>',

			toggle_info    = '<S-Tab>',
			toggle_preview = '<Tab>',
		},
	}
}
