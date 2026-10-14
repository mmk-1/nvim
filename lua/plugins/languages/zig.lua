return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "zig" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "zls" } } },
  { "neovim/nvim-lspconfig", opts = { servers = { zls = {} } } },
}
