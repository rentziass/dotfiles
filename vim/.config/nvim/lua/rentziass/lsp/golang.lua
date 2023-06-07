local features = require("rentziass.features")
local lspconfig = require("lspconfig")
local cfg = require("rentziass.lsp.default_config")
local config = cfg.defaults()

config.on_attach = function(client, bufnr)
  if not features.gofumpt then
    -- disable  formatting for gopls so that goimports handles it through
    -- null-ls
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.semanticTokensProvider = {
      full = true,
      legend = {
        tokenTypes = { 'namespace', 'type', 'class', 'enum', 'interface', 'struct', 'typeParameter', 'parameter', 'variable', 'property', 'enumMember', 'event', 'function', 'method', 'macro', 'keyword', 'modifier', 'comment', 'string', 'number', 'regexp', 'operator', 'decorator' },
        tokenModifiers = { 'declaration', 'definition', 'readonly', 'static', 'deprecated', 'abstract', 'async', 'modification', 'documentation', 'defaultLibrary'}
      }
    }
  end

  cfg.on_attach(client, bufnr)
end

config.settings = {
  gopls = {
    usePlaceholders = true,
    gofumpt = features.gofumpt,
    semanticTokens = true,
  }
}

lspconfig.gopls.setup(config)
