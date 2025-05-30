--                 _       _
--                | |     (_)
--  _ __ ___ _ __ | |_ _____  __ _ ___ ___
-- | '__/ _ \ '_ \| __|_  / |/ _` / __/ __|
-- | | |  __/ | | | |_ / /| | (_| \__ \__ \
-- |_|  \___|_| |_|\__/___|_|\__,_|___/___/
--
--

vim.g.mapleader = ' '

if vim.g.vscode then
  -- VSCode extension
  require 'rentziass.vscode'
else
  -- ordinary Neovim
  require 'rentziass.utils'
  -- require 'rentziass.plugins'     --old way
  require 'rentziass.config' -- new way
  require 'rentziass.editor'
  require 'rentziass.term'
  require 'rentziass.lsp'

  vim.keymap.set("n", "<leader>z", require("lazy").home)
end
