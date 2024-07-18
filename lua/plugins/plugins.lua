return {

  { "nvim-lua/plenary.nvim" },

  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 100,
    config = function()
      require "plugins/config/kanagawa"
      vim.cmd [[colorscheme kanagawa]]
    end,
  },
  { "jiangmiao/auto-pairs" },
  {
    "voldikss/vim-floaterm",
    config = function()
      require "plugins/config/vim-floaterm"
    end,
  },
  { "ervandew/supertab" },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  {
    "kien/ctrlp.vim",
    config = function()
      require "plugins/config/ctrlp"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "plugins/config/lualine"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "plugins/config/nvim-tree"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins/config/nvim-treesitter"
    end,
  },
  -- telescope confing
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    config = function()
      require "plugins/config/telescope"
    end,
  },

  -- lsp config
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "hrsh7th/cmp-vsnip",
  },
  {
    "hrsh7th/vim-vsnip",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "honza/vim-snippets",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- dependencies = { "honza/vim-snippets" },
    config = function()
      require "plugins/config/luasnip"
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins/config/lsp"
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require "plugins/config/null-ls"
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require "plugins/config/formatter"
    end,
  },

  {
    "ojroques/vim-oscyank",
  },
  {
    "marcelofern/vale.nvim",
    config = function()
      require "plugins/config/vale"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- {
  --     "aserowy/tmux.nvim",
  --     config = function()
  --         require('plugins/config/tmux')
  --     end
  -- },

  -- {
  --     "elentok/format-on-save.nvim",
  --     config = function()
  --         require('plugins/config/format_on_save')
  --     end
  -- },
  -- {
  --  "mfussenegger/nvim-lint",
  --  config = function()
  --    require('plugins/config/nvim-lint')
  --  end
  -- },
}
