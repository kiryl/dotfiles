require('nord').set()
local colors = require('nord.colors')

-- Transparency
vim.g.nord_disable_background = true

vim.g.nord_borders = true

vim.cmd.colorscheme('nord')

-- Highlight leap search direction
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

-- Brighter window borders
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.nord9_gui })

-- Less noisy spelling errors
vim.api.nvim_set_hl(0, 'SpellBad', { sp = colors.nord11_gui, underdouble = true})
