return {

  ----------------------------------- # from here


  -- call dein#add('nvim-telescope/telescope-file-browser.nvim')
  { 'nvim-lua/plenary.nvim'
  },
  { 'Shougo/deoplete.nvim',
    config = function()
      require('plugins/config/deoplete')
    end
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

  {'akinsho/toggleterm.nvim', 
    version = "*", 
    config = true,
    config = function()
      require('plugins/config/toggleterm')
    end
  },
 
  { 'voldikss/vim-floaterm',
    config = function()
      require('plugins/config/vim-floaterm')
    end
  },
  { 'ervandew/supertab',
    config = function()
      require('plugins/config/supertab')
    end
  },
  { "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 10000,
    config = function()
      require('plugins/config/kanagawa')
      vim.cmd[[colorscheme kangawa]]
    end
  },

  ----------------------------------- # to this points
  ---
  { "folke/tokyonight.nvim",
    lazy = false,
    priority = 500,
    opts = {},
    config = function()
      vim.cmd[[colorscheme tokyonight]]
      require('plugins/config/tokyonight')
    end
  },
  { 'kien/ctrlp.vim',
    config = function()
      require('plugins/config/ctrlp')
    end
  },
  { 'blueshirts/darcula',
    lazy = true,
    priority = 10000,
    config = function()
      vim.cmd([[colorscheme darcula]])
    end
  },

  {
    'editorconfig/editorconfig-vim',
    config = function()
      require('plugins/config/editorconfig-vim')
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require('plugins/config/nvim-lspconfig')
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
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins/config/mason')
    end
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require('plugins/config/nvim-cmp')
    end
  },
  {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require('plugins/config/nvim-treesitter')
      end
  },
  {
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make' ,
    config = function()
      require('plugins/config/telescope-fzf-native')
    end
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
  { 'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require('plugins/config/telescope-frecency')
    end
  },
  {
   "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    opts = function()
      return require("plugins/config/others").blankline
    end,
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end,
  },
}
