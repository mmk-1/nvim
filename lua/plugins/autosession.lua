return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    -- Uses vim.ui.select (Snacks picker)
    { '<leader>sr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>sw', '<cmd>AutoSession save<CR>',   desc = 'Save session' },
    { '<leader>sa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_save = true,
    auto_restore = false,
    auto_create = false,
  }
}
