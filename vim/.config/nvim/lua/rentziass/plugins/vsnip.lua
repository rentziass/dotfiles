-- Snippets key bindings
vim.api.nvim_set_keymap('i', '<C-j>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", {
  silent = true,
  expr = true,
})

vim.api.nvim_set_keymap('s', '<C-j>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", {
  silent = true,
  expr = true,
})
