require('rentziass.utils.keymaps')

NMap('<Leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' , '-g', '!vendor'}})<cr>")
NMap('<Leader>fg', ":lua require'telescope.builtin'.live_grep({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' , '-g', '!vendor'}})<CR>")

NMap('<Leader>fb', ':Telescope git_branches<CR>')
NMap('<Leader>fc', ':Telescope git_commits<CR>')
NMap('<Leader>gs', ':Telescope git_status<CR>')

NMap('<Leader>cs', "<cmd>lua require'telescope.builtin'.colorscheme()<cr>")
