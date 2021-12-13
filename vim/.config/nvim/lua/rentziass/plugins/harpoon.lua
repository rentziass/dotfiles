local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>j', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>k', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>l', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>;', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)
