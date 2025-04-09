local M = {
  'stevearc/oil.nvim',
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  keys = {
    { "<leader>dd", "<cmd>Oil<cr>", desc = "Open Oil" },
  },
  lazy = false,
}

function M.config()
  require("oil").setup({
    default_file_explorer = true,
  })
end

return M
