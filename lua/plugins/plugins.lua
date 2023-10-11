return {

  { 'nvim-lua/plenary.nvim'
  },

  { "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 100,
    config = function()
      require('plugins/config/kanagawa')
      vim.cmd[[colorscheme kanagawa]]
  end
  },
  { 'Shougo/deoplete.nvim',
  },
  { 'zchee/deoplete-jedi',
  },
  { 'davidhalter/jedi-vim',
  },
  { 'Shougo/neosnippet.vim',
  },
  { 'Shougo/neosnippet-snippets',
  },
  { 'w0rp/ale',
  },
  { 'jiangmiao/auto-pairs',
  },
  { 'voldikss/vim-floaterm',
    config = function()
      require('plugins/config/vim-floaterm')
    end
  },
  { 'ervandew/supertab',
  },

  { 'kien/ctrlp.vim',
    config = function()
      require('plugins/config/ctrlp')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins/config/lualine')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins/config/gitsigns')
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugins/config/comment')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins/config/nvim-tree')
    end
  },
  {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require('plugins/config/nvim-treesitter')
      end
  },
  -- telescope confing
  {
     'nvim-telescope/telescope-fzf-native.nvim', build = 'make' ,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {  'nvim-lua/plenary.nvim',"nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },},
    cmd = "Telescope",
    config = function()
      require('plugins/config/telescope')
    end
  },

-- lsp-condig 

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- lsp config 
  -- {
  --   "williamboman/mason.nvim",
  --   cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  -- },
  -- {
  --   'hrsh7th/cmp-nvim-lsp'
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  -- },
  -- {
  --   'williamboman/mason-lspconfig.nvim',
  -- },
  -- {
  --  "neovim/nvim-lspconfig",
  --  config = function()
  --    require('plugins/config/lsp')
  --  end
  -- },
}

