return {
	{
		'echasnovski/mini-git',
		version = '*',
		main = 'mini.git',
		event = { "BufReadPost", "InsertEnter" },
		opts = {},
	},
	{
		'echasnovski/mini.diff',
		version = '*',
		event = { "BufReadPost", "InsertEnter" },
		opts = {},
	},
}
