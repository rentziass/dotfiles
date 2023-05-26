-- Keymaps
local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
    return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

keymap('n', '<Leader>s', ':w<CR>', { silent = true }) -- save

-- LSP stuff
-- gd (go to definition) works by default
keymap('n', '<Leader>xr', notify 'references-view.findReferences', { silent = true }) -- language references
keymap('n', 'gr', notify 'editor.action.goToReferences', { silent = true })
keymap('n', '<Leader>rn', notify 'editor.action.rename', { silent = true })
keymap('n', '<Leader>fm', notify 'editor.action.formatDocument', { silent = true })
keymap('n', '<Leader>ca', notify 'editor.action.refactor', { silent = true }) -- language code actions
keymap('n', ']d', notify 'editor.action.marker.next', { silent = true }) -- next diagnostic
keymap('n', '[d', notify 'editor.action.marker.prev', { silent = true }) -- previous diagnostic
keymap('v', '<Leader>ca', v_notify 'editor.action.refactor', { silent = true })

-- Telescope things
keymap('n', '<Leader>f', notify 'workbench.action.quickOpen', { silent = true }) -- find files
keymap('n', '<Leader>g', notify 'workbench.action.findInFiles', { silent = true }) -- search in files
keymap('n', '<Leader>o', notify 'workbench.action.gotoSymbol', { silent = true }) -- search symbols in file
keymap('v', '<Leader>p', v_notify 'workbench.action.showCommands', { silent = true })

-- VSCode view management
-- Nvim tree equivalents
keymap('n', '<C-n>', notify 'workbench.action.toggleSidebarVisibility', { silent = true })
keymap('n', '<Leader>nf', notify 'workbench.files.action.showActiveFileInExplorer', { silent = true })

keymap('n', '<Leader>th', notify 'workbench.action.toggleAuxiliaryBar', { silent = true }) -- toggle docview (help page)
keymap('n', '<C-w>o', notify 'workbench.action.closeOtherEditors .', { silent = true }) -- close everything but current "split"
