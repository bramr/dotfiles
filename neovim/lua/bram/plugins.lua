-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  -- Color scheme
  "folke/tokyonight.nvim",

  -- Libraries
  "nvim-lua/popup.nvim",          -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",        -- Useful lua functions used in lots of plugins
  "nvim-neotest/nvim-nio",        -- Async io library
  "nvim-tree/nvim-web-devicons",  -- Use nerd fonts

  -- Autopairs
  "windwp/nvim-autopairs",

  -- Splash screan
  "goolord/alpha-nvim",

  -- Fast navigation
  "nvim-telescope/telescope.nvim",

  -- Fast file manipulation
  {
    "stevearc/oil.nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require("oil").setup()
    end
  },

  -- Mason / LSP
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          },
          registries = {
            "github:mason-org/mason-registry",
            "github:crashdummyy/mason-registry"
          }
        }
      },
      "neovim/nvim-lspconfig"
    }
  },


  -- Learning your own keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },

  -- Idiot code completion
  "github/copilot.vim",

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  },


      -- LSP
  { 'neovim/nvim-lspconfig' },

  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    event = 'InsertEnter',
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      "hrsh7th/cmp-cmdline", -- cmdline completions
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- Debugging
  "mfussenegger/nvim-dap",
  {
    "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap" },
      config = function()
        require('dapui').setup()
      end
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
  },

  -- Golang
  {
    "ray-x/go.nvim",
      config = function()
        require('go').setup()
      end
  },

  -- Csharp
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        -- your configuration comes here; leave empty for default settings
      broad_search = true,
      silent = true
    },
  },

  -- Windline bubble
  {
    "windwp/windline.nvim",
      config = function()
        require "wlsample.bubble"
      end
  },

  -- File tree
  {
    'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require 'nvim-tree'.setup {} end
  },

  -- Terminal
  "akinsho/toggleterm.nvim",

  -- Formatting/ Trailing whitespace
  "mhartington/formatter.nvim",
  "bronson/vim-trailing-whitespace"
})

