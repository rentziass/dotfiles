local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>g", builtin.live_grep)
vim.keymap.set("n", "<leader>F", builtin.resume)
vim.keymap.set("n", "<leader>B", builtin.buffers)

telescope.setup({
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
})

telescope.load_extension("ui-select")
