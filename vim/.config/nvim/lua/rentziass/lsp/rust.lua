-- Server setup
local server_name = 'rust_analyzer'
local function ServerConfig()
  return DefaultServerConfig()
end

SetupServer(server_name, ServerConfig())
