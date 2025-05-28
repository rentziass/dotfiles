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
