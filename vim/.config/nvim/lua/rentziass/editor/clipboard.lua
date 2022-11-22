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
