local use = require('packer').use

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'folke/trouble.nvim' }
  use { 'numToStr/Comment.nvim' }
  use { 'RRethy/nvim-base16' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'savq/melange-nvim' }

  -- use { 'kyazdani42/nvim-tree.lua' }
end)
