return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "folke/snacks.nvim",
  },
  cmd = { "Neogit", "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit" },
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
  },
  opts = {
    integrations = {
      snacks = true,
    },
  },
}
