return {
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
}
