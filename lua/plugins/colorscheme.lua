return {
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonfly")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        navic = false,
      },
    },
  },
  {
    "D0nw0r/dark2026.nvim",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    build = false,
  },
  {
    "decaycs/decay.nvim",
    name = "decay",
  }
}
