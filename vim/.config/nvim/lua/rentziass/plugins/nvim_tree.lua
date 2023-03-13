require('rentziass.utils.keymaps')

NMap('<C-n>', ':NvimTreeToggle<CR>')
NMap('<Leader>nf', ':NvimTreeFindFile<CR>')
NMap('<Leader>r', ':NvimTreeRefresh<CR>')

require('nvim-tree').setup({
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
