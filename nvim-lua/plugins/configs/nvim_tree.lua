vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<Leader>nr', ':NvimTreeRefresh<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFindFile<CR>',
  { noremap = true, silent = true }
)
