local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find files" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find files" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Project dir)" },
		{ "<leader>pp", "<cmd>Telescope projects<cr>", desc = "Projects" },
		{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
	},
}

function M.config()
	require('telescope').setup()

	require


return M
