function telescope_config()
  local telescope = require('telescope')

  telescope.load_extension('fzf')

  telescope.setup {
    pickers = {
      live_grep = {
        theme = 'dropdown',
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      }
    }
  }
end
