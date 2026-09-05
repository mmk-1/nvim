local themes = {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      overrides = function(colors)
        return {
          -- cyberdream already has fg color as #fff
          FloatBorder = { fg = colors.fg, bg = colors.bg },
        }
      end,
    },
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      integrations = {
        navic = false,
      },
    },
  },
}

vim.schedule(function()
  vim.cmd.colorscheme("cyberdream")
end)

return themes
