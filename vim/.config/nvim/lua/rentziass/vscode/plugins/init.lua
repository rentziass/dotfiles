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
    'nvim-treesitter/nvim-treesitter', -- just the best thing
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "go",
          "c_sharp",
          "rust",
          "typescript",
          "bash",
          "dockerfile",
          "graphql",
          "hcl", -- Hashicorp language (used by Terraform)
          "org", -- Orgmode
          "markdown",
          "devicetree",
          "ruby",
          "vimdoc",
          "zig",
          "dart",
        },
        highlight = {
          enable = true, -- false will disable the whole extension
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "BufReadPre",
    config = true,
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
      vim.keymap.set('n', '<leader>m', require('treesj').toggle)
    end,
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { '<leader>a', ':lua require("harpoon.mark").add_file()<CR>' },
      { '<C-e>',     ':lua require("harpoon.ui").toggle_quick_menu()<CR>' },

      { '<leader>j', ':lua require("harpoon.ui").nav_file(1)<CR>' },
      { '<leader>k', ':lua require("harpoon.ui").nav_file(2)<CR>' },
      { '<leader>l', ':lua require("harpoon.ui").nav_file(3)<CR>' },
      { '<leader>;', ':lua require("harpoon.ui").nav_file(4)<CR>' },
    }
  },
  {
    'linrongbin16/gitlinker.nvim',
    event = "BufReadPre",
    config = function()
      require('gitlinker').setup()
      -- browse
      vim.keymap.set(
        { "n", 'v' },
        "ghc",
        "<cmd>GitLink<cr>",
        { silent = true, noremap = true, desc = "Yank git permalink" }
      )
      vim.keymap.set(
        { "n", 'v' },
        "gho",
        "<cmd>GitLink!<cr>",
        { silent = true, noremap = true, desc = "Open git permalink" }
      )
      vim.keymap.set(
        { "n", 'v' },
        "ghb",
        "<cmd>GitLink blame<cr>",
        { silent = true, noremap = true, desc = "Yank git blame link" }
      )
    end
  },
})
