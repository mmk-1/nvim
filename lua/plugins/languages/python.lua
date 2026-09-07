return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "python" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "basedpyright", "ruff" } } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              -- Ruff owns import organization
              disableOrganizeImports = true,
              analysis = {
                typeCheckingMode = "standard",
              },
            },
          },
        },
        ruff = {
          on_attach = function(client)
            -- basedpyright owns hover docs
            client.server_capabilities.hoverProvider = false
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { python = { "ruff_format", "ruff_organize_imports" } },
    },
  },
}
