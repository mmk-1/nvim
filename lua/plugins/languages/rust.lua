-- Rust toolchain is managed by rustup, not Mason.
-- Install / update with:
--   rustup component add rust-analyzer rustfmt clippy
-- rust-analyzer uses clippy for diagnostics (check.command below).
return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "rust" } } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = { command = "clippy" },
              inlayHints = {
                typeHints = { enable = true },
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { rust = { "rustfmt" } },
    },
  },
}
