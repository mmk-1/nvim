--[[

All the lsp configurations containing packages are installed in here.
- nvim-lspconfig
- mason
- mason-lspconfig

]]

local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "saghen/blink.cmp" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
}

function M.config()
  require('config.lsp.setup')
end

return M

