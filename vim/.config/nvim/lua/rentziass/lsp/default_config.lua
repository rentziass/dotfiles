local function on_attach(client, _bufnr)
  local builtin = require("telescope.builtin")
  local h = require("rentziass.h")

  -- Using LSP defaults
  h.nnoremap("gD", vim.lsp.buf.declaration)
  h.nnoremap("gd", vim.lsp.buf.definition)
  h.nnoremap("<Leader>rn", vim.lsp.buf.rename)
  h.nnoremap("<Leader>t", vim.lsp.buf.type_definition)
  h.nnoremap("K", vim.lsp.buf.hover)
  h.nnoremap("<Leader>k", vim.lsp.buf.signature_help)

  -- Using Telescope
  h.nnoremap("<Leader>o", builtin.lsp_dynamic_workspace_symbols)
  h.nnoremap("gr", builtin.lsp_references)
  h.nnoremap("gI", builtin.lsp_implementations)
  h.nnoremap("<Leader>ca", vim.lsp.buf.code_action)
  h.xnoremap("<Leader>ca", vim.lsp.buf.range_code_action)

  h.nnoremap("<Leader>;", function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
  end)
  h.nnoremap("]d", function()
    vim.diagnostic.goto_next({ float = { focus = false, border = "rounded" } })
  end)
  h.nnoremap("[d", function()
    vim.diagnostic.goto_prev({ float = { focus = false, border = "rounded" } })
  end)

  -- Disable virtual diagnostics because they are mostly annoying
  vim.diagnostic.config({ virtual_text = false })
end

local M = {}

--- Returns the default configurations that are common to all LSPs
M.defaults = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  return {
    capabilities = capabilities,
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    },
    on_attach = on_attach,
  }
end
M.on_attach = on_attach

return M
