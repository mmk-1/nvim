return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catpuccin",
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
}
