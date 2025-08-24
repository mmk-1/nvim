return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = { left = '', right = '' }, -- remove separators
      section_separators = { left = '', right = '' },   -- remove separators
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 0,                                  -- path = 0 means just show the filename itself, increase number to show parent dirs
          color = { fg = '#1e1e2e', bg = '#a6e3a1' } -- Change background color (you can adjust this hex value)
          -- Function below is to change the color
          -- based on mode which catppuccin does for the default sections.
          -- I don't use it but kept for reference.
          -- color = function()
          --   local mode_colors = {
          --     n = { fg = '#1e1e2e' },
          --     i = { fg = '#89b4fa' },
          --     v = { fg = '#f38ba8' },
          --     V = { fg = '#f38ba8' },
          --     [''] = { fg = '#f38ba8' },
          --     c = { fg = '#f9e2af' },
          --     r = { fg = '#f5c2e7' },
          --     t = { fg = '#cba6f7' },
          --   }
          --   return { fg = mode_colors[vim.fn.mode()] and mode_colors[vim.fn.mode()].fg or '#1e1e2e', bg = '#a6e3a1' }
          -- end
        },
        {
          "navic",
        }
      }
    }
  },
}
