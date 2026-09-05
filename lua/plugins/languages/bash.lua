return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "bash" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "bashls" } } },
  { "neovim/nvim-lspconfig", opts = { servers = { bashls = {} } } },
}
