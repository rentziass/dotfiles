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
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "BufReadPre",
    config = true,
  },
}
