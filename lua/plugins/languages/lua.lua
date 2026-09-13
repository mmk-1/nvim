return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "lua", "luadoc", "luap" } } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmylua_ls = {
          settings = {
            emmylua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                -- Neovim's own API/types plus loaded plugin runtime files.
                library = vim.api.nvim_get_runtime_file("", true),
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
      formatters_by_ft = { lua = { "stylua" } },
      formatters = {
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "AutoPreferDouble",
          },
        },
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
}
