local M = {
	"stevearc/conform.nvim",
	opts = {},
}

function M.config()
	require("conform").setup({
		-- Define your formatters by filetype
		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "alejandra" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			jsx = { "prettier" },
		},

		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},

		-- Customize formatters
		-- formatters = {
		--   clang_format = {
		--     "-style",
		--     "{IndentWidth: 4}",
		--   },
		-- },
	})
end

return M
