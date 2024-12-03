return function ()
  require("mason").setup({
    ui = { border = "rounded" },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "gopls",
      "marksman",
      "lua_ls",
      "ts_ls",
      "yamlls",
      "dockerls",
      "zls",
    },
  })

  require("rentziass.lsp.null-ls")

  require('lspkind').init({})

  require('lspsaga').init_lsp_saga({
    code_action_keys = {
      quit = {'q', '<esc>', '<C-c>'}, exec = '<CR>'
    },
    rename_action_keys = {
      quit = {'<esc>', '<C-c>'}, exec = '<CR>'
    },
  })

  -- require('rentziass.lsp.go_tests')
  -- require('rentziass.lsp.keymaps')
  -- require('rentziass.lsp.server_config')

  -- LSP servers configurations
  require('rentziass.lsp.c#')
  require('rentziass.lsp.docker')
  require('rentziass.lsp.golang')
  require('rentziass.lsp.lua')
  require('rentziass.lsp.solargraph')
  require('rentziass.lsp.sorbet')
  require('rentziass.lsp.rust')
  require('rentziass.lsp.typescript')
  require('rentziass.lsp.yaml')
  require('rentziass.lsp.zig')

  -- WIP
  -- require('rentziass.lsp.protobuf')

end
