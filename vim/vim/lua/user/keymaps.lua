map = vim.api.nvim_set_keymap

-- Remove search highlight and re-evaluate syntax highlighting
map('n', '<c-l>', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>', { noremap = true })

-- Automatically send mouse selection to clipboard (workaround for Neovim #2325)
map('v', '<LeftRelease>', '"*ygv', { noremap = true })

-- Navigate windows
map('n', '<A-j>', '<C-w>w', { noremap = true })
map('n', '<A-k>', '<C-w>W', { noremap = true })
map('n', '<Leader><Left>', 'gT', { noremap = true })
map('n', '<Leader><Right>', 'gt', { noremap = true })
map('n', '<A-m>', ':ZoomWinTabToggle<CR>', { noremap = true })

-- Disable arrow keys completely
map('', '<Left>', '<Nop>', { noremap = true })
map('', '<Right>', '<Nop>', { noremap = true })
map('', '<Up>', '<Nop>', { noremap = true })
map('', '<Down>', '<Nop>', { noremap = true })
map('i', '<Left>', '<Nop>', { noremap = true })
map('i', '<Right>', '<Nop>', { noremap = true })
map('i', '<Up>', '<Nop>', { noremap = true })
map('i', '<Down>', '<Nop>', { noremap = true })

-- Telescope
map('n', '<Leader><Leader>', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
map('n', '<Leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true })
map('n', '<Leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true })
map('n', '<Leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true })

map('n', 'z=', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', { noremap = true })
