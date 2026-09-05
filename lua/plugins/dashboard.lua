return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  opts = function()
    local home = os.getenv('HOME')

    return {
      theme = 'doom',
      config = {
        header = {
          '',
          '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
          '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
          '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
          '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
          '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
          '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
          '',
          '☕ I love tea.',
          '',
        },
        center = {
          {
            icon = '󰏗 ',
            icon_hl = 'Title',
            desc = 'Projects',
            desc_hl = 'String',
            key = 'p',
            keymap = '<leader>pp',
            key_hl = 'Number',
            action = 'Telescope projects'
          },
          {
            icon = '󰆓 ',
            icon_hl = 'Title',
            desc = 'Sessions',
            desc_hl = 'String',
            key = 's',
            keymap = '<leader>sr',
            key_hl = 'Number',
            action = 'SessionSearch'
          },
          {
            icon = '󰥨 ',
            icon_hl = 'Title',
            desc = 'File Browser',
            desc_hl = 'String',
            key = 'e',
            keymap = '<leader>dd',
            key_hl = 'Number',
            action = 'Oil ~'
          },
          {
            icon = '󰈞 ',
            icon_hl = 'Title',
            desc = 'Find Files',
            desc_hl = 'String',
            key = 'f',
            keymap = '<leader>ff',
            key_hl = 'Number',
            action = function()
              require('telescope.builtin').find_files({ cwd = home })
            end
          },
          {
            icon = '󰗼 ',
            icon_hl = 'Title',
            desc = 'Quit',
            desc_hl = 'String',
            key = 'q',
            key_hl = 'Number',
            action = 'qa'
          },
        },
        footer = {
          '',
          '💭 "Hesitation is defeat."',
          '',
        },
        vertical_center = true,
      }
    }
  end
}
