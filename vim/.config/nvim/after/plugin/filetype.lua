-- set filetype for terminals
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd.set "filetype=term"

    -- Start insert mode when opening a terminal
    -- if vim.opt.buftype:get() == "terminal" then
    --   vim.cmd(":startinsert")
    -- end
  end,
})


-- enter insert mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end,
})
