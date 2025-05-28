return {
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
}
