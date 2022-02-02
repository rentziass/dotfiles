require('rentziass.utils.keymaps')

NMap('<leader>a', ':lua require("harpoon.mark").add_file()<CR>')
NMap('<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
NMap('<leader>tc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')

NMap('<leader>j', ':lua require("harpoon.ui").nav_file(1)<CR>')
NMap('<leader>k', ':lua require("harpoon.ui").nav_file(2)<CR>')
NMap('<leader>l', ':lua require("harpoon.ui").nav_file(3)<CR>')
NMap('<leader>;', ':lua require("harpoon.ui").nav_file(4)<CR>')
