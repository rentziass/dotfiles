vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_command([[
augroup GoFormatting
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])

--- GO
require'lspconfig'.gopls.setup{}
