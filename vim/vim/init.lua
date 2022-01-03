require 'user.options'
require 'user.keymaps'

-- Plugin-specific configs
require 'user.cmp'
require 'user.lsp'
require 'user.treesitter'
require 'user.telescope'
require 'user.better-whitespace'
require 'user.lualine'
require 'user.tabline'
require 'user.trouble'
require 'user.nord'

local packer = require('packer')
local use = packer.use

packer.startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = cmp_config,
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'

  -- Language Server Protocol
  use {
    'neovim/nvim-lspconfig',
    config = lsp_config,
  }
  use 'weilbith/nvim-lsp-smag'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = treesitter_config,
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = telescope_config,
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  -- Navigation
  use 'ggandor/lightspeed.nvim'

  -- Syntax
  use {
    'ntpeters/vim-better-whitespace',
    config = better_whitespace_config,
  }

  -- Window and buffer management
  use 'troydm/zoomwintab.vim'

  use {
    'shaunsingh/nord.nvim',
    config = nord_config,
  }

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = lualine_config,
  }

  use {
    'kdheepak/tabline.nvim',
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'},
    config = tabline_config,
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = trouble_config,
  }
end)
