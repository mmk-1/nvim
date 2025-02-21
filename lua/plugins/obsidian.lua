local M = {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "master",
        path = "~/Koofr/obsidian/master",
      },
    },
    attachments = {
      img_folder = "000_Attachments",
    }
  },

  keys = {
    { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Open Obsidian Note" },
    { "<leader>n/", "<cmd>ObsidianSearch<cr>",      desc = "Search Through Notes" },
  },
}

return M
