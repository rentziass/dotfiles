require('lspsaga').init_lsp_saga({
  code_action_keys = {
    quit = {'q', '<esc>', '<C-c>'}, exec = '<CR>'
  },
  rename_action_keys = {
    quit = {'<esc>', '<C-c>'}, exec = '<CR>'
  },
})
