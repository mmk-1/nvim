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
      { "<leader>f", group = "Find" },
      { "<leader>s", group = "Session" },
      { "<leader>b", group = "Buffers" },
      { "<leader>p", group = "Projects" },
      { "<leader>d", group = "Oil" },
      { "<leader>l", group = "LSP" },
      { "<leader>t", group = "Treesitter" },
      { "<leader>ts", desc = "Init selection" },
      { "<leader>ti", desc = "Increment node" },
      { "<leader>tc", desc = "Increment scope" },
      { "<leader>td", desc = "Decrement node" },
      { "gr", group = "LSP" },
    },
  },
}
