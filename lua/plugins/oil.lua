return {
  'stevearc/oil.nvim',
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  keys = {
    { "<leader>dd", "<cmd>Oil<cr>", desc = "Open Oil" },
  },
  lazy = false,
  opts = {
    default_file_explorer = true
  }
}
