local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
  },
}

function M.config()
  local builtin = require "statuscol.builtin"
  local cfg = {
    setopt = true,
    relculright = true,
    segments = {
      { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },
      { text = { "%s" }, click = "v:lua.ScSa" },
      { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    },
  }

  require("statuscol").setup(cfg)

  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  local language_servers = require("lspconfig").util.available_servers()
  for _, ls in ipairs(language_servers) do
    require("lspconfig")[ls].setup({
      capabilities = capabilities,
    })
  end
  require("ufo").setup()
end

return M
