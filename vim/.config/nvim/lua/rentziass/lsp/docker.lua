local lspconfig = require("lspconfig")
local cfg = require("rentziass.lsp.default_config")
local config = cfg.defaults()

lspconfig.dockerls.setup(config)
