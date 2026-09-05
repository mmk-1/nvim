return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    -- Uses vim.ui.select (Snacks picker)
    { '<leader>sr', '<cmd>SessionSearch<CR>',         desc = 'Session search' },
    { '<leader>ss', '<cmd>SessionSave<CR>',           desc = 'Save session' },
    { '<leader>sa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
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
