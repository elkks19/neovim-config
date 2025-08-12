return{
	"folke/snacks.nvim",
	priority = 1000,
	opts = {
		bigfile = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
					{ icon = " ", key = "e", desc = "File Explorer", action = "<leader>e" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "g", desc = "Find Text", action = "<leader>fs" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
    			header = require('config.headers').random_header(),
			},
			sections = {
				-- FIX: Acabar esta parte pq esta bonita
				-- {
					-- function()
					-- 	local in_git = Snacks.git.get_root() ~= nil
					-- 	local cmds = {
					-- 		{
					-- 			title = "Open Issues",
					-- 			cmd = "gh issue list -L 5",
					-- 			key = "i",
					-- 			action = function()
					-- 				vim.fn.jobstart("gh issue list --web", { detach = true })
					-- 			end,
					-- 			icon = " ",
					-- 			height = 7,
					-- 		},

					-- 		-- TODO: Igual hacer funcionar esta wea como cron job cosa de que se actualice con un archivo cada x tiempo
					-- 		{
					-- 			pane = 2,
					-- 			title = "Notifications",
					-- 			cmd = "gh notify -s -a -n2",
					-- 			action = function()
					-- 				vim.ui.open("https://github.com/notifications")
					-- 			end,
					-- 			key = "N",
					-- 			icon = " ",
					-- 			height = 4,
					-- 			enabled = true,
					-- 		},
					-- 		{
					-- 			pane = 2,
					-- 			icon = " ",
					-- 			title = "Open PRs",
					-- 			cmd = "gh pr list -L 2",
					-- 			key = "P",
					-- 			action = function()
					-- 				vim.fn.jobstart("gh pr list --web", { detach = true })
					-- 			end,
					-- 			height = 4,
					-- 		},
					-- 	}

					-- 	return vim.tbl_map(function(cmd)
					-- 		return vim.tbl_extend("force", {
					-- 			section = "terminal",
					-- 			enabled = in_git,
					-- 			padding = 1,
					-- 			ttl = 5 * 60,
					-- 			indent = 3,
					-- 		}, cmd)
					-- 	end, cmds)
					-- end,
				-- 	gap = 1,
				-- },


				require('config.headers').random_section(),
				{
					{
						section = "keys",
						gap = 1,
						padding = 1,
					},
					{
						icon = " ",
						desc = "Browse repo",
						padding = 1,
						key = "b",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						action = function()
							Snacks.gitbrowse()
						end,
					},
					{
						section = "startup",
					},
				},
				{
					pane = 2,
					section = "terminal",
					cmd = "cbonsai -liL 30 -t 0,2",
					height = 29,
					gap = 0,
					padding = 1,
					ttl = 15,
				},
			}
		},
	}
}

