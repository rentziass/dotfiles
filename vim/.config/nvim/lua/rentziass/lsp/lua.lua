local lspconfig = require("lspconfig")
local cfg = require("rentziass.lsp.default_config")
local config = cfg.defaults()
local neodev = require("neodev")

neodev.setup()

config.settings = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file('', true),
      checkThirdParty = false,
    },
  },
}
-- Disable the diagnostics from the LSP as I tipically use luacheck, which is configured on null-ls
config.handlers["textDocument/publishDiagnostics"] = function() end
config.on_attach = function(client, bufnr)
  -- disable  formatting for gopls so that goimports handles it through
  -- null-ls
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  cfg.on_attach(client, bufnr)
end

lspconfig.lua_ls.setup(config)
