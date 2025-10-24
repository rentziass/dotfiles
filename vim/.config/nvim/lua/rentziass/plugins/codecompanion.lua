return {
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ravitemer/mcphub.nvim",
    },
    keys = {
      {
        "<leader>i",
        "<cmd>CodeCompanion<cr>",
        mode = { "n", "v" },
        desc = "Code Companion inline",
      },
      {
        "<C-i>",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = { "n", "v" },
        desc = "Toggle Code Companion chat",
      },
      {
        "ga",
        "<cmd>CodeCompanionChat Add<cr>",
        mode = { "v" },
        desc = "Add selected text to Code Companion chat",
      },
    },
    opts = {
      memory = {
        opts = {
          chat = {
            enabled = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
          model = "gpt-5",
        },
        inline = {
          adapter = "copilot",
          model = "gpt-5",
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        }
      }
    },
    init = function()
      require("rentziass.plugins.codecompanion.fidget-spinner"):init()

      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}
