local M = {}

--- Returns the default configurations that are common to all LSPs
M.defaults = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  return {
    capabilities = capabilities,
  }
end

return M
