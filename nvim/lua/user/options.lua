-- Automatically indent when adding a curly bracket, etc.
vim.o.smartindent = true

-- Show offset of line relative to current
vim.o.relativenumber = true
vim.o.number = true

-- Display signs in the number column
vim.o.signcolumn = 'number'

-- highlight current line
vim.opt.cursorline = true

-- Use system clipboard as default paste/delete/yank register
vim.o.clipboard = 'unnamed'

-- If there are caps, go case-sensitive
vim.o.ignorecase = true
vim.o.smartcase = true

-- Shell-like completions
vim.o.wildmode = 'longest,full'

-- A better completion experience
vim.o.completeopt = 'menu,menuone,noinsert,noselect'

-- Max height for completion list
vim.o.pumheight = 30

-- Do not redraw while running macros (much faster)
vim.o.lazyredraw = true

-- You can change buffer without saving
vim.o.hidden = true

-- Show matching brackets
vim.o.showmatch = true

-- Keep 5 lines (top/bottom) for scope
vim.o.scrolloff = 5

-- Keep 5 lines at the side
vim.o.sidescrolloff = 5

-- Do not wrap strings
vim.o.wrap = false

-- vim.o.fold method
vim.o.foldmethod = 'marker'

-- Persistent undo
vim.o.undofile = true

-- Show tabs, eol, etc.
vim.o.list = true

-- Symbols to indicate tabstops and EOLs when 'list' is set
vim.o.listchars = vim.o.listchars .. ',nbsp:+,eol:↴'

-- Split vertical windows right to the current windows
vim.o.splitright = true

-- Split horizontal windows below to the current windows
vim.o.splitbelow = true

-- Automatically save before :next, :make etc.
vim.o.autowrite = true

-- Do not insert two spaces after a '.', '?' and '!' with a join command.
vim.o.joinspaces = false

-- Use both cscope and ctag for ‘ctrl-]’, ‘:tag’, and ‘vim -t’
vim.o.cscopetag = false

-- Terminal scrollback size
vim.o.scrollback = 100000

-- Enable mouse support
vim.o.mouse = 'a'

-- Place case labels under switch() (C language)
vim.o.cinoptions = ':0(0'

-- Enable filetype plugins
vim.cmd [[ filetype plugin indent on ]]

-- Set <Leader>
vim.g.mapleader = ' '

-- .h files are C, not C++
vim.g.c_syntax_for_h = true

-- Enable spelling by default
vim.o.spell = true

vim.o.laststatus = 3

-- vim-better-whitespace
vim.g.show_spaces_that_precede_tabs = true
