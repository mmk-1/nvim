return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^3.0.0",
  lazy = false,
  dependencies = {
    {
      "smart-splits-nvim/backend-zellij-lua",
      main = "smart-splits-backend-zellij-lua",
      opts = {},
    },
    {
      "smart-splits-nvim/backend-tmux",
      main = "smart-splits-backend-tmux",
    },
  },
  opts = {
    mux = {
      backend = {
        "smart-splits-backend-zellij-lua",
        "smart-splits-backend-tmux",
      },
    },
  },
  config = function(_, opts)
    local ss = require("smart-splits")
    ss.setup(opts)

    vim.keymap.set("n", "<A-h>", ss.resize_left, { desc = "Resize left" })
    vim.keymap.set("n", "<A-j>", ss.resize_down, { desc = "Resize down" })
    vim.keymap.set("n", "<A-k>", ss.resize_up, { desc = "Resize up" })
    vim.keymap.set("n", "<A-l>", ss.resize_right, { desc = "Resize right" })

    vim.keymap.set("n", "<C-h>", ss.move_cursor_left, { desc = "Move to left split" })
    vim.keymap.set("n", "<C-j>", ss.move_cursor_down, { desc = "Move to below split" })
    vim.keymap.set("n", "<C-k>", ss.move_cursor_up, { desc = "Move to above split" })
    vim.keymap.set("n", "<C-l>", ss.move_cursor_right, { desc = "Move to right split" })
  end,
}
