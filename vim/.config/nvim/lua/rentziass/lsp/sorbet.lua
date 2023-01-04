local features = require("rentziass.features")

-- I don't want sorbet to be automatically setup. Only if the project  is using
-- it and has it as binstub.
if not features.sorbet then
	return
end

local lspconfig = require("lspconfig")
local cfg = require("rentziass.lsp.default_config")
local config = cfg.defaults()

config.cmd = { "bin/srb", "tc", "--lsp" }

lspconfig.sorbet.setup(config)
