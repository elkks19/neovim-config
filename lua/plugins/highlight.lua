return {
	'echasnovski/mini.hipatterns',
	version = '*',
	event = { "BufReadPost", "InsertEnter" },
	config = function()
		local plugin = require('mini.hipatterns')
		plugin.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fix	  = { pattern = '%f[%w]()FIX()%f[%W]', 	 group = 'MiniHipatternsFixme' },
				fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
				todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
				note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = plugin.gen_highlighter.hex_color(),
			},
		})
	end,
}
