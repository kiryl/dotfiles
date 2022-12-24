-- Remove search highlight and re-evaluate syntax highlighting
vim.keymap.set('n', '<c-l>', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>', { noremap = true })

-- Automatically send mouse selection to clipboard (workaround for Neovim #2325)
vim.keymap.set('v', '<LeftRelease>', '"*ygv', { noremap = true })

-- Navigate windows
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true })
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true })

-- Disable arrow keys completely
vim.keymap.set('', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Right>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('', '<Down>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Right>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<Down>', '<Nop>', { noremap = true })

-- Move selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
