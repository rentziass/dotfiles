local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

------------------------------------------------
-------------- treesitter ----------------------
------------------------------------------------
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  indent = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

------------------------------------------------
-------------- harpoon -------------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>j', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>k', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>l', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>;', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

------------------------------------------------
-------------- nvim_tree -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', opts)
require('nvim-tree').setup()

------------------------------------------------
-------------- telescope -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' , '-g', '!vendor'}})<cr>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope git_commits<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>', opts)

------------------------------------------------
-------------- Octo.nvim -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>pr', ':Octo pr list<CR>', opts)

------------------------------------------------
-------------- lspkind-nvim --------------------
------------------------------------------------
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

------------------------------------------------
-------------- lspsaga -------------------------
------------------------------------------------
require('lspsaga').init_lsp_saga({
  code_action_keys = {
    quit = {'q', '<esc>', '<C-c>'}, exec = '<CR>'
  },
  rename_action_keys = {
    quit = {'<esc>', '<C-c>'}, exec = '<CR>'
  },
})

------------------------------------------------
-------------- trouble -----------------------
------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>dw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', opts)
