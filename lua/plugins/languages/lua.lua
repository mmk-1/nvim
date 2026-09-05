return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "lua", "luadoc", "luap" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "lua_ls" } } },
  { "neovim/nvim-lspconfig", opts = { servers = { lua_ls = {} } } },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { lua = { "stylua" } } } },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
