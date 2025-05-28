require("rentziass.config.lazy")

require('rentziass.config.todo-comments')
require('rentziass.config.vsnip')

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
