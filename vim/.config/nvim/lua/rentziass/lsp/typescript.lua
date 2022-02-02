-- Server setup
local server_name = 'tsserver'
local function ServerConfig()
  return DefaultServerConfig()
end

SetupServer(server_name, ServerConfig())
