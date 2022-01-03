function lualine_config()
  require('lualine').setup {
    sections = {
      lualine_b = {
        'branch', 'diff',
        {
          'diagnostics',
          symbols = { error = ' ', warn = ' ', hint = ' ', info = ' '},
        }
      },
    },
    tabline = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { require'tabline'.tabline_buffers },
      lualine_x = { require'tabline'.tabline_tabs },
      lualine_y = {},
      lualine_z = {},
    },
  }
end
