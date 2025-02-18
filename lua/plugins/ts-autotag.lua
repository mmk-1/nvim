local M = {
	"windwp/nvim-ts-autotag",
	ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "jsx", "tsx" },
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("nvim-ts-autotag").setup()
end

return M
