return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle filesystem reveal left<cr>", desc = "Open the file explorer" },
		{ "<leader>we", "<cmd>Neotree toggle filesystem reveal float<cr>", desc = "Open the file explorer" }
	},
    dependencies = {
      	"nvim-lua/plenary.nvim",
      	"MunifTanjim/nui.nvim",
      	"nvim-tree/nvim-web-devicons",
    },
	opts = {
        window = {
            mappings = {
                ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false }},
				["<C-p>"] = { "scroll_preview", config = { direction = 10}},
				["<C-n>"] = { "scroll_preview", config = { direction = -10} },
            },
        },
        close_if_last_window = true,
  		auto_clean_after_session_restore = true,
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
            	hide_gitignored = true,
				hide_by_pattern = {
					'*/*_templ.go',
					'*/*_templ.txt',
				},
				always_show = {
				  	".gitignored",
					".env",
				},
				always_show_by_pattern = {
					"*.env",
				},
          	},
		},
	},
}

