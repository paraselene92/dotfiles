return {
	"sourcegraph/sg.nvim",
	config = function()
		require("sg").setup({
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			build = "nvim -l build/init.lua",
			enable_cody = true,
			cody = {
				autocomp = "v1",
			},
		})
	end,
}
