--[[

All the lsp configurations containing packages are installed in here.
- nvim-lspconfig
- mason
- mason-lspconfig

]]

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "saghen/blink.cmp" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    require('config.lsp.setup') -- I've moved the all the lsp setup stuff to here for better modularity
  end
}
