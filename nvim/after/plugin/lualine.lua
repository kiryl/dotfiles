require('lualine').setup {
  options = {
    theme = 'nord',
  },
  sections = {
    lualine_b = {
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', hint = ' ', info = ' '},
      }
    },
    lualine_c = {
      {'filename', path = 1}
    },
  },
}
