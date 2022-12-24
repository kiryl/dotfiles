require 'user.autocmd'
require 'user.options'
require 'user.keymaps'

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',

      -- Snippets
      'L3MON4D3/LuaSnip',

      -- Misc
      'weilbith/nvim-lsp-smag',
      'ray-x/lsp_signature.nvim',
      'onsails/lspkind.nvim',
    }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }
  use 'smartpde/telescope-recent-files'

  -- Navigation
  use {
    'ggandor/leap.nvim',
    requires = {
      'tpope/vim-repeat',
      'ggandor/flit.nvim'
    }
  }

  -- Text-objects
  use {
    'kana/vim-textobj-entire',
    requires = 'kana/vim-textobj-user'
  }

  -- Syntax
  use 'ntpeters/vim-better-whitespace'

  -- UI
  use 'shaunsingh/nord.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
end)
