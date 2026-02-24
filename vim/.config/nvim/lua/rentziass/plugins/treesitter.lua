return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter').install({
        "go",
        "c_sharp",
        "rust",
        "typescript",
        "bash",
        "dockerfile",
        "graphql",
        "hcl", -- Hashicorp language (used by Terraform)
        "markdown",
        "devicetree",
        "ruby",
        "vimdoc",
        "zig",
        "dart",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "BufReadPre",
    config = true,
  },
}
