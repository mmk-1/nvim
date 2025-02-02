local M = {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>dd", "<cmd>Oil<cr>", desc = "Open Oil" },
  }
}

return M
