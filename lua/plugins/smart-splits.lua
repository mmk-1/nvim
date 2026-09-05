return {
  "mrjones2014/smart-splits.nvim",
  version = ">=1.0.0",
  lazy = false,
  config = function()
    require("smart-splits").setup({})

    -- resize (Alt)
    vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize left" })
    vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize down" })
    vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize up" })
    vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize right" })

    -- move (Ctrl)
    vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
    vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
    vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above split" })
    vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
  end,
}
