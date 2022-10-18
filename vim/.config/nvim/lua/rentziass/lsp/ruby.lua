-- Server setup
local server_name = 'sorbet'
local function ServerConfig()
  return DefaultServerConfig()
end

SetupServer(server_name, ServerConfig())
