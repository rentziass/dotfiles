function Map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, {
    noremap = true,
    silent = true,
  })
end

function NMap(shortcut, command)
  Map('n', shortcut, command)
end

function IMap(shortcut, command)
  Map('i', shortcut, command)
end

function BufMap(bufnr, mode, shortcut, command)
  vim.api.nvim_buf_set_keymap(bufnr, mode, shortcut, command, {
    noremap = true,
    silent = true,
  })
end

function BufNMap(bufnr, shortcut, command)
  BufMap(bufnr, 'n', shortcut, command)
end

function BufIMap(bufnr, shortcut, command)
  BufMap(bufnr, 'i', shortcut, command)
end

function BufVMap(bufnr, shortcut, command)
  BufMap(bufnr, 'v', shortcut, command)
end
