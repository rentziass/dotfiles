local features = require("rentziass.features")

-- I don't want solargraph or rubocop to be automatically setup. Only if the
-- project  is using them and has them as binstubs.
if not features.solargraph then
  return {}
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp.solargraph', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client then
      return
    end

    if client.name ~= 'solargraph' then
      return
    end

    client.server_capabilities.documentFormattingProvider = features.rubucop
    client.server_capabilities.documentRangeFormattingProvider = features.rubocop
  end,
})

return {}
