return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      jsx = { "prettier" },
      cpp = { "clang_format" },
      c = { "clang_format" },
      h = { "clang_format" },
      rust = { "rustfmt" },
    },

    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },

    clang_format = {
      formatters = {
        "-style",
        "{IndentWidth: 4}",
      },
    },
  }
}
