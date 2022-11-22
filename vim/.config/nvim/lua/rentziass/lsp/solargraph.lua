-- Server setup
local server_name = 'solargraph'
local function ServerConfig()
  local config = DefaultServerConfig()
  config.cmd = { "bin/srb", "tc", "--lsp" }
  -- config.settings = { solargraph = { diagnostics = not features.rubocop } }
  config.cmd = { "bin/solargraph", "stdio" }
  config.on_attach = function(client, bufnr)
    -- disable  formatting for solargraph so that rubocop handles it through
    -- null-ls
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  return config
end

SetupServer(server_name, ServerConfig())
