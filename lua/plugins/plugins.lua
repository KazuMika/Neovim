
return {

  { 'kien/ctrlp.vim',
    config = function()
      require('plugins/config/ctrlp')
    end
  },
  { 
    'blueshirts/darcula',
    config = function()
      vim.cmd([[colorscheme darcula]])
    end
  },

  {
  'editorconfig/editorconfig-vim',
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
  },

  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
  },
    {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    cmd = "Telescope",
  },
}
