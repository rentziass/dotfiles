require('rentziass.utils.keymaps')

NMap('<C-n>', ':NvimTreeToggle<CR>')
NMap('<Leader>n', ':NvimTreeFindFile<CR>')
NMap('<Leader>r', ':NvimTreeRefresh<CR>')

require('nvim-tree').setup()
