-- check Packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'tpope/vim-sensible'
  use 'myusuf3/numbers.vim'
  use 'chriskempson/base16-vim'
  use 'jiangmiao/auto-pairs'
  use 'danishprakash/vim-githubinator'
  use 'ianks/vim-tsx'
  use 'leafgarland/typescript-vim'
  use 'tpope/vim-fugitive'
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-surround'
  use {'fatih/vim-go', tag = 'v1.24'}
  use 'uarun/vim-protobuf'
  use 'honza/vim-snippets'
  use 'jparise/vim-graphql'
  use 'AndrewRadev/splitjoin.vim'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'pwntester/octo.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
end)
