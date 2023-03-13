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
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/trouble.nvim",
      "folke/neodev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "onsails/lspkind-nvim",
      "tami5/lspsaga.nvim",
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
    },
    config = require("rentziass.lsp"),
  },

  {
    'nvim-treesitter/nvim-treesitter', -- just the best thing
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate'
  },

  {
    'williamboman/mason.nvim',
    dependencies = {
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
    }
  },

  {
    'crispgm/nvim-go',
    config = function ()
      require('go').setup({
        -- notify: use nvim-notify
        notify = false,
        -- auto commands
        auto_format = false,
        auto_lint = false,
        -- linters: revive, errcheck, staticcheck, golangci-lint
        linter = 'golangci-lint',
        -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
        linter_flags = {},
        -- lint_prompt_style: qf (quickfix), vt (virtual text)
        lint_prompt_style = 'qf',
        -- formatter: goimports, gofmt, gofumpt, lsp
        formatter = 'gofumpt',
        -- maintain cursor position after formatting loaded buffer
        maintain_cursor_pos = true,
        -- test flags: -count=1 will disable cache
        test_flags = {'-v'},
        test_timeout = '0',
        test_env = {},
        -- show test result with popup window
        test_popup = true,
        test_popup_auto_leave = false,
        test_popup_width = 80,
        test_popup_height = 10,
        -- test open
        test_open_cmd = 'edit',
        -- struct tags
        tags_name = 'json',
        tags_options = {'json=omitempty'},
        tags_transform = 'snakecase',
        tags_flags = {'-skip-unexported'},
        -- quick type
        quick_type_flags = {'--just-types'},
      })
    end
  },

  -- Center buffer on big screens
  {
    'shortcuts/no-neck-pain.nvim',
    version = "*",
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        end
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  -- Colorschemes
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[ colorscheme tokyonight ]])
    end
  },
  'ellisonleao/gruvbox.nvim',
  'projekt0n/github-nvim-theme',

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-vsnip',
    }
  },

  'jiangmiao/auto-pairs',
  'tpope/vim-sensible',
  'myusuf3/numbers.vim',
  'danishprakash/vim-githubinator',
  'tpope/vim-fugitive',
  'numToStr/Comment.nvim',
  'tpope/vim-surround',
  'AndrewRadev/splitjoin.vim',

  'tjdevries/colorbuddy.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-ui-select.nvim',
    },
  },
  'kyazdani42/nvim-web-devicons',
  'towolf/vim-helm',
  'github/copilot.vim',
  -- use {
  --   'zbirenbaum/copilot.lua',
  --   requires = {{"github/copilot.vim"}},
  --   event = {"VimEnter"},
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end
  -- }
  -- use {
  --   'zbirenbaum/copilot-cmp',
  --   requires = {{'zbirenbaum/copilot.lua'}}
  -- }

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },

  'ThePrimeagen/harpoon',
  'stevearc/dressing.nvim',
  'nvim-orgmode/orgmode',
})
