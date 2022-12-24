local telescope = require('telescope')
local builtin = require('telescope.builtin')
local trouble = require('trouble.providers.telescope')

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    layout_strategy = 'vertical',
    layout_config = { height = 0.95 },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    recent_files = {
      only_cwd = true
    },
  }
}

telescope.load_extension('fzf')
telescope.load_extension('recent_files')

vim.keymap.set('n', '<Leader><Leader>', telescope.extensions.recent_files.pick, { noremap = true })
vim.keymap.set('n', '<Leader>f', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<Leader>g', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<Leader>b', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<Leader>h', builtin.help_tags, { noremap = true })

vim.keymap.set('n', 'z=', builtin.spell_suggest, { noremap = true })
