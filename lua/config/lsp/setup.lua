local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
  ui = {
    border = "rounded",
  },
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "pyright",
    "bashls",
    "clangd",
    -- "eslint",
    -- "prettier",
  },
  automatic_installation = true,
})

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
  -- Telescope LSP pickers
  vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
  vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
  vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", opts)
end

-- Config for diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
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

  ["ts_ls"] = function()
    require("typescript-tools").setup(default_config)
  end,

  ["eslint"] = function()
    local eslint_config = {
      on_attach = default_config.on_attach,
      capabilities = default_config.capabilities,
      flags = {
        allow_incremental_sync = false,
        debounce_text_changes = 1000,
        exit_timeout = 1500,
      },
    }
    lspconfig.eslint.setup(eslint_config)
  end,
})
