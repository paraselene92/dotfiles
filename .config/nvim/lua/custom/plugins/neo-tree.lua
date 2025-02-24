return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
				cwd_target = {
					sidebar = "window", -- sidebar is when position = left or right
					current = "window", -- current is when position = current
				},
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
	end,
}
