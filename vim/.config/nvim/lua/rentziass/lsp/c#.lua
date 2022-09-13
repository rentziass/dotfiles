-- Server setup
local server_name = 'omnisharp'
local function ServerConfig()
  local config = DefaultServerConfig()
  return config
end

SetupServer(server_name, ServerConfig())
