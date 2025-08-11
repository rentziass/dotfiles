local features = require("rentziass.features")

return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  settings = {
    gopls = {
      gofumpt = features.gofumpt,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      usePlaceholders = true,
      completeUnimported = true,
      matcher = "fuzzy",
      codelenses = {
        gc_details = true,
        generate = true,
        tidy = true,
        upgrade_dependency = true,
      },
      semanticTokens = true,
    },
  },
}
