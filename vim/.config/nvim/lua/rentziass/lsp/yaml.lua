-- Server setup
local server_name = 'yamlls'
local function ServerConfig()
  local config = DefaultServerConfig()
  config.settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["kubernetes"] = "**/k8s/**",
      },
    }
  }
  return config
end

SetupServer(server_name, ServerConfig())
