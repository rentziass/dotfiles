require('rentziass.plugins.bundle')

require('rentziass.plugins.cmp')
require('rentziass.plugins.comment-nvim')
require('rentziass.plugins.harpoon')
require('rentziass.plugins.no-neck-pain')
require('rentziass.plugins.nvim-treesitter')
require('rentziass.plugins.nvim_tree')
require('rentziass.plugins.orgmode')
require('rentziass.plugins.telescope')
require('rentziass.plugins.todo-comments')
require('rentziass.plugins.vsnip')

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
