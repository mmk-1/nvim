return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  opts = {
    integrations = {
      -- This integration doesn't work, so i disabled
      -- and defined my own in nvim-navic.lua
      navic = false,
    },
  },
  config = function(_, opts)
    vim.cmd([[colorscheme catppuccin-macchiato]])
    require("catppuccin").setup(opts)
  end,
}
