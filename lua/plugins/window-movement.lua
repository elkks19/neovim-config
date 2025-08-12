return {
	{
		'chaoren/vim-resizewindow',
		keys = {
			{ '<M-j>', '<Plug>ResizeWindowDown', desc = 'resize window downwards' },
			{ '<M-J>', '5<Plug>ResizeWindowDown', desc = 'resize window downwards faster' },
			{ '<M-k>', '<Plug>ResizeWindowUp', desc = 'resize window upwards' },
			{ '<M-K>', '5<Plug>ResizeWindowUp', desc = 'resize window upwards faster' },
			{ '<M-h>', '<Plug>ResizeWindowLeft', desc = 'resize window to the left' },
			{ '<M-H>', '5<Plug>ResizeWindowLeft', desc = 'resize window to the left faster' },
			{ '<M-l>', '<Plug>ResizeWindowRight', desc = 'resize window to the right' },
			{ '<M-L>', '5<Plug>ResizeWindowRight', desc = 'resize window to the right faster' },
		},
	},
	{
		'szw/vim-maximizer',
		cmd = { 'MaximizerToggle'},
		keys = {
			{ '<leader>sm', '<cmd>MaximizerToggle<CR>', { desc = 'Maximize a window' }}
		}
	},
	{
		'christoomey/vim-tmux-navigator',
		cmd = {
			'TmuxNavigateLeft',
			'TmuxNavigateDown',
			'TmuxNavigateUp',
			'TmuxNavigateRight',
			'TmuxNavigatePrevious',
		},
		keys = {
			{ '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', { desc = 'Navigate Left' } },
			{ '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', { desc = 'Navigate Down' } },
			{ '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', { desc = 'Navigate Up' } },
			{ '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', { desc = 'Navigate Right' } },
			{ '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', { desc = 'Navigate Previous' } },
		},
	},
}

