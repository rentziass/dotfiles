return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = 'BufReadPre',
    dependencies = {
      "nvimtools/none-ls.nvim",
      "onsails/lspkind-nvim",
      "tami5/lspsaga.nvim",
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
    },
  },


  {
    "folke/neodev.nvim",
    ft = "lua",
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
      test_flags = { '-v' },
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
      tags_options = { 'json=omitempty' },
      tags_transform = 'snakecase',
      tags_flags = { '-skip-unexported' },
      -- quick type
      quick_type_flags = { '--just-types' },
    },
  },

  -- Center buffer on big screens
  {
    'shortcuts/no-neck-pain.nvim',
    version = "*",
    cmd = 'NoNeckPain',
    keys = {
      { '<leader>np', '<cmd>NoNeckPain<cr>' },
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
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
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
          { name = "buffer",  keyword_length = 5 },
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
      cmp.setup.cmdline({ '/', '?' }, {
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
      -- local servers = { 'gopls', 'lua_ls', 'ts_ls', 'yamlls', 'rust_analyzer' }
      -- for _, server in pairs(servers) do
      --   require('lspconfig')[server].setup {
      --     capabilities = capabilities
      --   }
      -- end
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  'myusuf3/numbers.vim',
  {
    'linrongbin16/gitlinker.nvim',
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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },    -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken",       -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    'ThePrimeagen/harpoon',
    keys = {
      { '<leader>a' },
      { '<C-e>' },

      { '<leader>j' },
      { '<leader>k' },
      { '<leader>l' },
      { '<leader>;' },
    },
    config = function()
      vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
      vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)

      vim.keymap.set("n", "<leader>j", function() require("harpoon.ui").nav_file(1) end)
      vim.keymap.set("n", "<leader>k", function() require("harpoon.ui").nav_file(2) end)
      vim.keymap.set("n", "<leader>l", function() require("harpoon.ui").nav_file(3) end)
      vim.keymap.set("n", "<leader>;", function() require("harpoon.ui").nav_file(4) end)
    end
  },

  { 'stevearc/dressing.nvim' },

  { "tjdevries/standard.vim", lazy = false, priority = 100 },
  { "tjdevries/conf.vim",     lazy = false, priority = 90 },

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

      -- same for lua
      vim.fn["edit_alternate#rule#add"]("lua", function(filename)
        if filename:find "_spec.lua" then
          return (filename:gsub("_spec%.lua", ".lua"))
        else
          return (filename:gsub("%.lua", "_spec.lua"))
        end
      end)

      vim.api.nvim_set_keymap("n", "<leader>ea", "<cmd>EditAlternate<CR>", { silent = true })
    end,
    priority = 80,
  },

  {
    "tjdevries/express_line.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
    {
      "pwntester/octo.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("octo").setup({
          use_local_fs = false,
        })

        vim.treesitter.language.register('markdown', 'octo')
      end
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("oil").setup {
          columns = { "icon" },
          keymaps = {
            ["<C-h>"] = false,
            ["<M-h>"] = "actions.select_split",
          },
          view_options = {
            show_hidden = true,
          },
        }

        -- Open parent directory in current window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Open parent directory in floating window
        vim.keymap.set("n", "<space>-", require("oil").toggle_float)
      end,
    },

    { "imsnif/kdl.vim" },


    -- DAP
    {
      "mfussenegger/nvim-dap",
      dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
      },
      config = function()
        local dap = require "dap"
        local ui = require "dapui"

        require("dapui").setup()
        require("dap-go").setup()

        require("nvim-dap-virtual-text").setup {}


        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
          require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F10>", require("dapui").toggle)

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)
        vim.keymap.set("n", "<F13>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
          ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          ui.close()
        end
      end,
    },
    {
      "S1M0N38/love2d.nvim",
      cmd = "LoveRun",
      opts = {},
      keys = {
        { "<leader>v",  ft = "lua",          desc = "LÖVE" },
        { "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
        { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
      },
    },
  }
}
