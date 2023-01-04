local features = require('rentziass.features')

if features.codespace then
  -- use rdm for clipboard within codespaces
  vim.g.clipboard = {
    name = "rdm",
    copy = {
      ["+"] = {"rdm", "copy"},
      ["*"] = {"rdm", "copy"}
    },
    paste = {
      ["+"] = {"rdm", "paste"},
      ["*"] = {"rdm", "paste"}
    },
  }
end

