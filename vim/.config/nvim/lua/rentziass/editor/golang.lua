-- Go Imports on save
goimports = vim.api.nvim_create_augroup("GoImports", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    GoImports(1000)
  end,
  group = goimports,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = false
    vim.opt_local.list = false
  end,
})
