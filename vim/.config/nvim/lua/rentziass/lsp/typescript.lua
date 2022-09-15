-- Server setup
local server_name = 'tsserver'
local function ServerConfig()
  local config = DefaultServerConfig()
  config.on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    LSPKeymaps(client, bufnr)
  end

  return config
end

SetupServer(server_name, ServerConfig())
