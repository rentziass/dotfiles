-- Server setup
local server_name = 'sorbet'
local function ServerConfig()
  local config = DefaultServerConfig()
  config.cmd = { "bin/srb", "tc", "--lsp" }
  return config
end

SetupServer(server_name, ServerConfig())
