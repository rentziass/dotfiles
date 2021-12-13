local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<Leader>pr', ':Octo pr list<CR>', opts)
