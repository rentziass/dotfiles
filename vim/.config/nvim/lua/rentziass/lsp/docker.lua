-- Server setup
local server_name = 'dockerls'
local function ServerConfig()
  return DefaultServerConfig()
end

SetupServer(server_name, ServerConfig())
