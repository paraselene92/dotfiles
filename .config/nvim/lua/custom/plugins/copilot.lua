return {
	"zbirenbaum/copilot.lua",
	lazy = false,
	priority = 1000,
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				gitcommit = true,
				["*"] = true,
			},
		})
	end,
}
