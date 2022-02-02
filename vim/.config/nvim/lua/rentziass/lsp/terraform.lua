-- Server setup
local server_name = 'terraformls'
local function ServerConfig()
  return DefaultServerConfig()
end

SetupServer(server_name, ServerConfig())
