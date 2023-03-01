require 'rentziass.lsp'

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  callback = function()
    -- Save cursor position to later restore
    local curpos = vim.api.nvim_win_get_cursor(0)

    -- Search and replace trailing whitespace
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, curpos)
  end,
  group = auto_formatting,
})

-- AUTO FORMATTING
auto_formatting = vim.api.nvim_create_augroup("AutoFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go", "*.rs", "*.ts" },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
  group = auto_formatting,
})
