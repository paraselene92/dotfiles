return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		-- provider = "copilot",
		providers = {
			copilot = {
				model = "claude-3.7-sonnet",
				max_line = 2000,
				extra_reuests_body = {
					temperature = 0.1,
				},
			},
		},
		auto_suggestion_provider = "copilot",
		behaviour = {
			auto_suggestion = true,
			auto_set_highlight_group = true,
			auto_set_keymap = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			ignore_small_files = false,
			minimize_diff = true,
		},
		ui = {
			popup = {
				border = "rounded",
				width = 80,
				height = 20,
				position = "50%",
				title = " Avante AI ",
				title_pos = "center",
			},
			markdown = {
				code_block_stylize = true,
				enable_mathjax = true,
			},
			virtual_text = {
				enabled = true,
			},
		},
		file_selector = {
			provider = "telescope",
			exclude_files = { "node_modules/", ".git/" },
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
