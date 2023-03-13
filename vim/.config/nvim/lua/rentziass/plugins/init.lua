require('rentziass.plugins.bundle')

require('rentziass.plugins.orgmode')
require('rentziass.plugins.todo-comments')
require('rentziass.plugins.vsnip')

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
