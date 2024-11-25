local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
  }
  
  
function M.config()
	local servers = {
        -- LSPs
		"lua_ls",
		"cssls",
		"html",
		"ts_ls",
		"pyright",
		"bashls",
		"jsonls",

        -- Formatters
        -- "stylua",
        -- "alejandra",
        -- "prettier",
	}

    require("mason").setup {
      ui = {
            border = "rounded",
		},
	}

	require("mason-lspconfig").setup {
		    ensure_installed = servers,
	}
end

return M
  