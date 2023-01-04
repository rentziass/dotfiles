local lspconfig = require("lspconfig")
local cfg = require("rentziass.lsp.default_config")
local config = cfg.defaults()

lspconfig.rust_analyzer.setup(config)
