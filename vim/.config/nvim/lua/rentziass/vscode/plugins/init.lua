local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-surround',
  {
    'tpope/vim-fugitive',
    -- load on :G
    cmd = "G",
  },
  {
    'ThePrimeagen/harpoon',
    keys = {
      { '<leader>a', ':lua require("harpoon.mark").add_file()<CR>' },
      { '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>' },

      { '<leader>j', ':lua require("harpoon.ui").nav_file(1)<CR>' },
      { '<leader>k', ':lua require("harpoon.ui").nav_file(2)<CR>' },
      { '<leader>l', ':lua require("harpoon.ui").nav_file(3)<CR>' },
      { '<leader>;', ':lua require("harpoon.ui").nav_file(4)<CR>' },
    }
  },
})
