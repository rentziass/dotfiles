-- check Packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- bootstrap LSP configuration
  use 'kabouzeid/nvim-lspinstall' -- install any LSP server
  use 'hrsh7th/vim-vsnip' -- LSP based snippets
  use 'hrsh7th/vim-vsnip-integ'
  use 'onsails/lspkind-nvim' -- add pictograms to autocompletion LSP results
  use 'tami5/lspsaga.nvim' -- some UI for LSP <- under trial
  use {
    'folke/trouble.nvim', -- display diagnostics (and more but that's why it's here)
    config = function()
      require('trouble').setup{}
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter', -- just the best thing
    branch = '0.5-compat',
    run = ':TSUpdate'
  }
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}} -- sick theme
  use 'joshdick/onedark.vim' -- Atom's theme

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-vsnip'

  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-sensible'
  use 'myusuf3/numbers.vim'
  use 'danishprakash/vim-githubinator'
  use 'tpope/vim-fugitive'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'AndrewRadev/splitjoin.vim'

  use 'tjdevries/colorbuddy.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'pwntester/octo.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use 'ThePrimeagen/harpoon'
end)
