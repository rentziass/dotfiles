-- Server setup
local server_name = 'gopls'
local function ServerConfig()
  local config = DefaultServerConfig()
  config.settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      semanticTokens = true,
    }
  }
  return config
end

SetupServer(server_name, ServerConfig())

-- Imports
function Go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end
