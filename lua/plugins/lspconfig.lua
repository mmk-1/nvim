local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "saghen/blink.cmp" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
}

function M.config()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    -- Show diagnostics
    vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  end

  -- Config for diagnostics
  vim.diagnostic.config({
    -- For future reference
    -- virtual_text = {
    --   prefix = "●",
    --   spacing = 4,
    -- },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "󰌵",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
    severity_sort = true,
    float = {
      focusable = true,
      source = "always",
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
    },
  })

  local default_config = {
    on_attach = lsp_attach,
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  }

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup(default_config)
    end,
  })
end

return M
