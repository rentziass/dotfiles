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
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip' -- LSP based snippets
  use 'hrsh7th/vim-vsnip-integ'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
  use 'lourenci/github-colors'
  use 'projekt0n/github-nvim-theme'

  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-sensible'
  use 'myusuf3/numbers.vim'
  use 'danishprakash/vim-githubinator'
  use 'tpope/vim-fugitive'
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-surround'
  use 'AndrewRadev/splitjoin.vim'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'pwntester/octo.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
end)
