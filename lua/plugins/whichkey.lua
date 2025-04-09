local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

function M.config()
  require("which-key").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
  })
end

return M
