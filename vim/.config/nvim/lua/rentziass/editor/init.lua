require('rentziass.utils')
require('rentziass.editor.formatting')
require('rentziass.editor.golang')

vim.cmd('colorscheme gruvbox')

-- Mappings
NMap('<C-s>', ':source $MYVIMRC<CR>') -- Reload configuration
NMap('<Leader>s', ':update<CR>') -- save file
NMap('<Leader>q', ':qall<CR>') -- close all files (and vim)

vim.o.swapfile = false
vim.o.history = 500
vim.o.termguicolors = true
vim.o.autowrite = true

-- Whitespace
vim.opt.list = true
vim.opt.listchars:append({ tab = "»·", trail = "·" })

-- <Tab>
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Search
vim.o.smartcase = true
vim.o.ignorecase = true

-- Line numbers
vim.o.number = true
vim.o.numberwidth = 5
vim.o.relativenumber = true

-- Persistent undo
vim.o.undofile = true

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Splits navigation
NMap('<C-j>', '<C-w><C-j>')
NMap('<C-k>', '<C-w><C-k>')
NMap('<C-l>', '<C-w><C-l>')
NMap('<C-h>', '<C-w><C-h>')

editor_group = vim.api.nvim_create_augroup("RentziassEditor", { clear = true })
-- For all text files set 'textwidth' to 78 characters.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text" },
  callback = function()
    vim.opt_local.textwidth = 78
  end,
  group = editor_group,
})

-- Enable spellchecking for Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end,
  group = editor_group,
})

-- Automatically wrap at 80 characters for Markdown
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.textwidth = 80
  end,
  group = editor_group,
})
