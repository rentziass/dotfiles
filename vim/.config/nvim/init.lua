--                 _       _
--                | |     (_)
--  _ __ ___ _ __ | |_ _____  __ _ ___ ___
-- | '__/ _ \ '_ \| __|_  / |/ _` / __/ __|
-- | | |  __/ | | | |_ / /| | (_| \__ \__ \
-- |_|  \___|_| |_|\__/___|_|\__,_|___/___/
--
--

vim.g.mapleader = ' '

local load = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

load 'rentziass.utils'
load 'rentziass.plugins'
load 'rentziass.editor'
load 'rentziass.lsp'
