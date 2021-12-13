local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' , '-g', '!vendor'}})<cr>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope git_commits<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>', opts)
