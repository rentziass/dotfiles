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
    event = 'BufReadPre',
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "onsails/lspkind-nvim",
      "tami5/lspsaga.nvim",
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
    },
    -- Lazy caching is sabotaging using this as config
    -- config = require("rentziass.lsp"),
  },


  {
    "folke/neodev.nvim",
    ft = "lua",
  },

  {
    'nvim-treesitter/nvim-treesitter', -- just the best thing
    build = ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup {
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
    'williamboman/mason.nvim',
    dependencies = {
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
    }
  },
  "williamboman/mason-lspconfig.nvim",

  {
    'crispgm/nvim-go',
    ft = 'go',
    opts = {
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
    },
  },

  -- Center buffer on big screens
  {
    'shortcuts/no-neck-pain.nvim',
    version = "*",
    cmd = 'NoNeckPain',
    keys = {
      {'<leader>np', '<cmd>NoNeckPain<cr>'},
    },
    opts = {
      width = 120,
    }
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
      -- vim.cmd([[ colorscheme tokyonight ]])
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      require('onedark').load()
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-vsnip',
    },
    config = function()
      local cmp = require "cmp"
      local lspkind = require "lspkind"

      cmp.setup {
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          },
          { "i", "c" }
          ),

          ["<c-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
              _ --[[fallback]]
              )
              if cmp.visible() then
                if not cmp.confirm { select = true } then
                  return
                end
              else
                cmp.complete()
              end
            end,
          },

          -- Testing
          ["<c-q>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },

          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<Down>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ["<Up>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        },

        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "orgmode" },
          { name = "path" },
          { name = "buffer", keyword_length = 5 },
          { name = "nvim_lua" },
        },

        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },

        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
              gh_issues = "[issues]",
              tn = "[TabNine]",
            },
          },
        },

        experimental = {
          -- Let's play with this for a day or two
          ghost_text = true,
        },
      }

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/', '?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        -- mapping = cmp.mapping.preset.insert({
          --   ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- }),
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline', keyword_length = 5 }
          })
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local servers = { 'gopls', 'lua_ls', 'tsserver', 'yamlls', 'rust_analyzer' }
        for _, server in pairs(servers) do
          require('lspconfig')[server].setup {
            capabilities = capabilities
          }
        end
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  'myusuf3/numbers.vim',
  'danishprakash/vim-githubinator',
  {
    'tpope/vim-fugitive',
    -- load on :G
    cmd = "G",
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },

  'tpope/vim-surround',

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

  'tjdevries/colorbuddy.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
      { "<leader>f" },
      { "<leader>g" },
      { "<leader>F" },
      { "<leader>B" },
      { '<leader>"' },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")

      vim.keymap.set("n", "<leader>f", builtin.find_files)
      vim.keymap.set("n", "<leader>g", builtin.live_grep)
      vim.keymap.set("n", "<leader>F", builtin.resume)
      vim.keymap.set("n", "<leader>B", builtin.buffers)
      vim.keymap.set("n", '<leader>"', function()
        builtin.registers(themes.get_cursor())
      end)

      telescope.setup({
        defaults = {
          preview = {
            treesitter = false,
          },
        },
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob", "!**/.git/*",
              "--glob", "!vendor",
              "--glob", "!node_modules",
            },
          },
          live_grep = {
            additional_args = function(opts)
              return {
                "--hidden",
                "--glob", "!.git/*",
                "--glob", "!vendor",
                "--glob", "!node_modules",
              }
            end
          },
        },
        extensions = {
          ["ui-select"] = {
            themes.get_cursor({}),
          },
        },
      })

telescope.load_extension("ui-select")
    end
  },

  'kyazdani42/nvim-web-devicons',
  {
    'towolf/vim-helm',
    ft = 'yaml',
  },
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

  { 'stevearc/dressing.nvim' },

  { "tjdevries/standard.vim", lazy = false, priority = 100 },
  { "tjdevries/conf.vim", lazy = false, priority = 90 },

  {
    "tjdevries/edit_alternate.vim",
    config = function()
      -- Add special alternates for golang
      -- Finds the alternate test
      vim.fn["edit_alternate#rule#add"]("go", function(filename)
        if filename:find "_test.go" then
          return (filename:gsub("_test%.go", ".go"))
        else
          return (filename:gsub("%.go", "_test.go"))
        end
      end)

      vim.api.nvim_set_keymap("n", "<leader>ea", "<cmd>EditAlternate<CR>", { silent = true })
    end,
    priority = 80,
  },

  -- lir
  "tamago324/lir.nvim",
  "tamago324/lir-git-status.nvim",
  {
    "tamago324/lir-mmv.nvim",
    cond = function()
      return vim.fn.executable "mmv" == 1
    end,
  },
})
