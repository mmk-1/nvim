local list_win = {
  type = "split",
  relative = "editor",
  position = "bottom",
  size = 12,
  wo = { wrap = true },
}

return {
  "folke/trouble.nvim",
  opts = {
    focus = false,
    win = list_win,
    preview = { type = "main" },
    modes = {
      symbols = { win = list_win },
    },
  },
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
    { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
    { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" },
    { "<leader>xl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP inspector" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
    { "<leader>xo", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
  },
}
