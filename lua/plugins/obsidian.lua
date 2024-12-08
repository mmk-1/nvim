local M = {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "master",
				path = "~/Dropbox/obsidian/master",
			},
		},
	},

	keys = {
		{ "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Open Obsidian Note" },
		{ "<leader>n/", "<cmd>ObsidianSearch<cr>", desc = "Search Through Notes" },
	},
}

return M
