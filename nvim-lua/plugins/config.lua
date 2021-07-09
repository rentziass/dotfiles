local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

------------------------------------------------
-------------- nvim_tree -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nr', ':NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFindFile<CR>', opts)

------------------------------------------------
-------------- telescope -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope git_commits<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>', opts)

------------------------------------------------
-------------- Octo.nvim -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>pr', ':Octo pr list<CR>', opts)
