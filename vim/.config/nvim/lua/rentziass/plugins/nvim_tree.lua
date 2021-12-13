local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', opts)
require('nvim-tree').setup()
