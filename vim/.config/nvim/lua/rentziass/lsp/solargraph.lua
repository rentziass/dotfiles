local features = require("rentziass.features")

-- I don't want solargraph or rubocop to be automatically setup. Only if the
-- project  is using them and has them as binstubs.
if not features.solargraph then
  return
end

local lspconfig = require("lspconfig")
local cfg = require("rentziass.lsp.default_config")
local config = cfg.defaults()

config.settings = { solargraph = { diagnostics = not features.rubocop } }
config.cmd = { "bin/solargraph", "stdio" }
config.on_attach = function(client, bufnr)
  -- disable  formatting for solargraph so that rubocop handles it through
  -- null-ls
  client.server_capabilities.documentFormattingProvider = features.rubucop
  client.server_capabilities.documentRangeFormattingProvider = features.rubocop
end

lspconfig.solargraph.setup(config)
