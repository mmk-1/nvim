local M = {
	"mrjones2014/smart-splits.nvim",
	version = ">=1.0.0",
}

M.config = function()
	require("nvim-autopairs").setup()
end

return M
