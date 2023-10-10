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
    name = "kanagawa",
    lazy = false,
    priority = 100,
    config = function()
      require('plugins/config/kanagawa')
      vim.cmd[[colorscheme kanagawa]]
  end
  },

  ----------------------------------- # to this points
  ---
  { "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 250,
    opts = {},
    config = function()
      vim.cmd[[colorscheme catppuccin-mocha]]
      require('plugins/config/catppuccin')
    end
  },
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
  {
    'editorconfig/editorconfig-vim',
    config = function()
      require('plugins/config/editorconfig-vim')
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
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {  'nvim-lua/plenary.nvim',"nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },},
    cmd = "Telescope",
  },
  {
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make' ,
  },
  {
      'nvim-telescope/telescope-frecency.nvim',
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('plugins/config/telescope')
    end
  },

-- lsp-condig 
-- -------------------------
   {
    "neovim/nvim-lspconfig",
    config = function()
      require('plugins/config/nvim-lspconfig')
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
      'williamboman/mason-lspconfig.nvim',
    config = function()
      require('plugins/config/mason-lspconfig')
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require('plugins/config/nvim-cmp')
    end
  },
  {
    'hrsh7th/vim-vsnip'
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    -- config = function()
    --   require('plugins/config/lsp')
    -- end
  },
--   {
--    "lukas-reineke/indent-blankline.nvim",
--     version = "2.20.7",
--     opts = function()
--       return require("plugins/config/others").blankline
--     end,
--     config = function(_, opts)
--       require("indent_blankline").setup(opts)
--     end,
--   },
}
