return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },

    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason.nvim",
    },
    opts = {
      servers = {},
    },
    config = function(_, opts)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      for name, server_opts in pairs(opts.servers) do
        vim.lsp.config(name, server_opts)
        vim.lsp.enable(name)
      end

      vim.diagnostic.config({
        severity_sort = true,
        float = {
          focusable = true,
          source = true,
          border = "rounded",
          header = "",
          prefix = "",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user.lsp", { clear = true }),
        callback = function(ev)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
          end

          map("gd", vim.lsp.buf.definition, "LSP: definition")
          map("gD", vim.lsp.buf.declaration, "LSP: declaration")
          map("<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, "LSP: workspace symbols")
        end,
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {},
      automatic_enable = false,
    },
  },
}
