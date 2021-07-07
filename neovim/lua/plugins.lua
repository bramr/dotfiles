local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path) execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua


return require("packer").startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim"

  -- Dark colorschemes
  use "tomasr/molokai"
  use "tanvirtin/monokai.nvim"
  use "folke/tokyonight.nvim"


  -- LSP Stuff
  use "neovim/nvim-lspconfig"
  use "nvim-lua/completion-nvim"
  use "glepnir/lspsaga.nvim"
  use "kabouzeid/nvim-lspinstall"
  use "folke/trouble.nvim"

  -- Better syntax hl
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- Other
  use {
      "numtostr/FTerm.nvim",
      config = function()
          require("FTerm").setup( {})
      end
  }
  use "bronson/vim-trailing-whitespace"


  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Whick key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- Custom setup
      }
    end
  }

end)
