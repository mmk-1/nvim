return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      nix = { "alejandra" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
  },
}
