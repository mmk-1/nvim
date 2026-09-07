return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "javascript", "typescript", "tsx" } },
  },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "vtsls" } } },
  { "neovim/nvim-lspconfig", opts = { servers = { vtsls = {} } } },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "jsx",
      "tsx",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
