return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "c", "cpp" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "clangd" } } },
  { "neovim/nvim-lspconfig", opts = { servers = { clangd = {} } } },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      formatters = {
        clang_format = {
          prepend_args = { "-style={IndentWidth: 4}" },
        },
      },
    },
  },
}
