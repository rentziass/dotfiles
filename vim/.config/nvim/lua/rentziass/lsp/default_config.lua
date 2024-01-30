local function on_attach(client, bufnr)
  local builtin = require("telescope.builtin")
  local h = require("rentziass.h")

  -- Using LSP defaults
  h.nnoremap("gD", vim.lsp.buf.declaration)
  h.nnoremap("gd", vim.lsp.buf.definition)
  h.nnoremap("<Leader>rn", vim.lsp.buf.rename)
  h.nnoremap("<Leader>td", vim.lsp.buf.type_definition)
  h.nnoremap("K", vim.lsp.buf.hover)
  h.nnoremap("<Leader>K", vim.lsp.buf.signature_help)

  -- Using Telescope
  h.nnoremap("<Leader>o", function ()
    builtin.lsp_document_symbols({ sort_lastused = true, layout_config = { width = 0.8 }, symbol_width = 50 })
  end)
  h.nnoremap("gr", function ()
    builtin.lsp_references({include_current_line = true})
  end)

  h.nnoremap("gI", builtin.lsp_implementations)
  h.nnoremap("<Leader>ca", vim.lsp.buf.code_action)

  h.nnoremap("<Leader>D", builtin.diagnostics)
  h.nnoremap("<Leader>d", function()
    vim.diagnostic.goto_next({ float = { focus = false, border = "rounded" } })
  end)
  h.nnoremap("[d", function()
    vim.diagnostic.goto_prev({ float = { focus = false, border = "rounded" } })
  end)

  h.nnoremap("<leader>tt", function()
    vim.api.nvim_command("GoTest")
  end)

  -- Disable virtual diagnostics because they are mostly annoying
  vim.diagnostic.config({ virtual_text = false })

  -- Disable diagnostics for helm buffers
  if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
    vim.diagnostic.disable(bufnr)
    vim.defer_fn(function()
      vim.diagnostic.reset(nil, bufnr)
    end, 1000)
  end
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
