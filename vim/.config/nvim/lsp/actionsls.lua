return {
  cmd = {
    "actions-languageserver", "--stdio",
  },
  filetypes = { "yaml.ghactions" },
  root_markers = { ".git" },
  init_options = {
    sessionToken = vim.fn.system("gh auth token"):gsub("%s+", ""), -- Remove whitespace/newlines
    -- logLevel = "info",
  },
}
