--[[
This package is a replacement for the ts_ls lsp server from Mason. It is faster and has more features.
It's configuration is setup in lspconfig.lua using the default settings. To override put this after
the default settings inside the mason_lspconfig.setup_handlers function.
]]

local M = {
  "pmizio/typescript-tools.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp"
  },
}

return M

