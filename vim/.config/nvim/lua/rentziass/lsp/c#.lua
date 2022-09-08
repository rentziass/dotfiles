-- Server setup
local server_name = 'csharp_ls'
local function ServerConfig()
  local config = DefaultServerConfig()
  return config
end

SetupServer(server_name, ServerConfig())
