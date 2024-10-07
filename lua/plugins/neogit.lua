local M = {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
}

function M.config()
	local neogit = require("neogit")
	neogit.setup()
end

return M
