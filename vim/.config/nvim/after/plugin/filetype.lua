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

-- set filetype for GitHub Actions workflow files
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = ".github/workflows/*.{yml,yaml}",
--   callback = function()
--     vim.bo.filetype = "yaml.ghaction"
--   end,
-- })
-- vim.filetype.add({
--   pattern = {
--     [".github/workflows/*.{yml,yaml}"] = "yaml.ghaction",
--   },
-- })

-- enter insert mode when opening a terminal
-- TODO: this puts me in insert mode after neotest runs a test
-- vim.api.nvim_create_autocmd("TermOpen", {
--   callback = function()
--     if vim.opt.buftype:get() == "terminal" then
--       vim.cmd(":startinsert")
--     end
--   end,
-- })
