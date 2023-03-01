-- To install packer:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/trouble.nvim",
      "folke/neodev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "onsails/lspkind-nvim",
      "tami5/lspsaga.nvim",
    },
    config = require("rentziass.lsp"),
  })

  use 'hrsh7th/vim-vsnip' -- LSP based snippets
  use 'hrsh7th/vim-vsnip-integ'
  use {
    'nvim-treesitter/nvim-treesitter', -- just the best thing
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'williamboman/mason.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  use({
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
  })

  -- Center buffer on big screens
  use {
    "shortcuts/no-neck-pain.nvim",
    tag = "*",
  }

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
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
  })

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
    end
  }

  -- Colorschemes
  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  use 'projekt0n/github-nvim-theme'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
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
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  })
  use 'kyazdani42/nvim-web-devicons'

  use 'github/copilot.vim'
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

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use 'ThePrimeagen/harpoon'

  use 'stevearc/dressing.nvim'

  use 'nvim-orgmode/orgmode'
end)
