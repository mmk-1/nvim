local M = {
	"nvim-treesitter/nvim-treesitter",
	-- main = "nvim-treesitter.configs",
	dir = "~/.local/share/nvim/nix/nvim-treesitter/",
	dev = true,
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		indent = {
			enable = true,
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>ss",
				node_incremental = "<leader>si",
				scope_incremental = "<leader>sc",
				node_decremental = "<leader>sd",
			},
		},
	})

	-- Folding
	-- vim.wo.foldmethod = 'expr'
	-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
end

return M
