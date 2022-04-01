require('rentziass.utils.keymaps')

-- keymaps
LSPKeymaps = function(_, bufnr)
  BufNMap(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  BufNMap(bufnr, '<space>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>")
  BufNMap(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  BufNMap(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  BufNMap(bufnr, 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  BufNMap(bufnr, 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
  BufNMap(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  BufNMap(bufnr, '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  BufNMap(bufnr, ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  BufNMap(bufnr, '<space>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
  BufVMap(bufnr, '<space>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
  BufNMap(bufnr, '<leader>dq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

  -- Golang
  BufNMap(bufnr, '<leader>tt', "<cmd>lua require('rentziass.lsp.go_tests').run_file()<CR>")
end
