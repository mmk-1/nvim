local M = {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
}

-- Test
function M.config()
  local leap = require("leap")
  leap.create_default_mappings()

  -- Below are recommended tweaks that I have no idea what they mean

  -- Define equivalence classes for brackets and quotes, in addition to
  -- the default whitespace group:
  leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

  -- Use the traversal keys to repeat the previous motion without
  -- explicitly invoking Leap:
  require('leap.user').set_repeat_keys('<enter>', '<backspace>')

  -- Define a preview filter (skip the middle of alphanumeric words):
  leap.opts.preview_filter =
      function(ch0, ch1, ch2)
        return not (
          ch1:match('%s') or
          ch0:match('%w') and ch1:match('%w') and ch2:match('%w')
        )
      end

  vim.api.nvim_set_hl(0, 'LeapMatch', { fg = '#000000', bg = '#FFFF00' })
  vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = '#000000', bg = '#FFFF00', bold = true })
  vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = '#000000', bg = '#FFDB00', bold = true })
end

return M
