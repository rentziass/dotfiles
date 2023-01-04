local lspconfig = require("lspconfig")
local config = require("rentziass.lsp.default_config").defaults()

config.settings = {
  yaml = {
    schemas = {
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      ["kubernetes"] = "**/k8s/**",
      ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
    },
  }
}

lspconfig.yamlls.setup(config)
