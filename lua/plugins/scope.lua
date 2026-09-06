return {
	'echasnovski/mini.indentscope',
	version = '*',
	event = { "BufReadPost", "InsertEnter" },
	opts = {
		delay = 40,
  		symbol = '|',
	}
}
