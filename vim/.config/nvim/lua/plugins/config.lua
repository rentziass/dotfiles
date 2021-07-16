local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

------------------------------------------------
----------------- theme ------------------------
------------------------------------------------
require("github-theme").setup({
  themeStyle = "dimmed",
})

------------------------------------------------
-------------- treesitter ----------------------
------------------------------------------------
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = false,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

------------------------------------------------
-------------- nvim_tree -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nr', ':NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFindFile<CR>', opts)

------------------------------------------------
-------------- telescope -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope git_commits<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>', opts)

------------------------------------------------
-------------- Octo.nvim -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>pr', ':Octo pr list<CR>', opts)
