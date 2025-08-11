local features = require("rentziass.features")

-- I don't want sorbet to be automatically setup. Only if the project  is using
-- it and has it as binstub.
-- if not features.sorbet then
--   return
-- end

return {
  cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
  filetypes = { "ruby" },
}
