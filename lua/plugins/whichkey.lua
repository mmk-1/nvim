return {
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
  opts = {
    spec = {
      { "<leader>g", group = "Git" },
      { "<leader>f", group = "Find" },
      { "<leader>s", group = "Save / Session" },
      { "<leader>ss", desc = "Save buffer" },
      { "<leader>b", group = "Buffers" },
      { "<leader>p", group = "Projects" },
      { "<leader>d", group = "Oil" },
      { "<leader>l", group = "LSP" },
      { "<leader>x", group = "Lists" },
      { "<leader>t", group = "Treesitter" },
      { "<leader>tf", desc = "Toggle fold" },
      { "<leader>to", desc = "Open all folds" },
      { "<leader>tF", desc = "Close all folds" },
      { "gr", group = "LSP" },
    },
  },
}
