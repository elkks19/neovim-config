return {
	'echasnovski/mini.comment',
	version = '*',
	event = { "BufReadPost", "InsertEnter" },
	opts = {
  		options = {
    		-- Whether to ignore blank lines when commenting
    		ignore_blank_line = true,
  		},
	},
}
