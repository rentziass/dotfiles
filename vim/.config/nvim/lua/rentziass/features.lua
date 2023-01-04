return {
  codespace = vim.env.CODESPACES == "true",

  -- golang
  gofumpt = vim.env.DISABLE_GOFUMPT ~= "true",

  -- ruby
  rubocop = vim.fn.executable("bin/rubocop") == 1,
  solargraph = vim.fn.executable("bin/solargraph") == 1,
  sorbet = vim.fn.executable("bin/srb") == 1,
}
