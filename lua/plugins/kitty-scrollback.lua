local M = {
  'mikesmithgh/kitty-scrollback.nvim',
  enabled = true,
  lazy = true,
}

function M.config()
  require('kitty-scrollback').setup()
end

return M
