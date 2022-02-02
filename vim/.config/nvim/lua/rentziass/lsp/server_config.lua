require('rentziass.lsp.keymaps')

function SetupServer(name, config)
  local lsp_installer_servers = require('nvim-lsp-installer.servers')
  local server_available, server = lsp_installer_servers.get_server(name)
  if server_available then
    server:on_ready(function ()
      server:setup(config)
    end)
    if not server:is_installed() then
      -- Queue the server to be installed.
      server:install()
    end
  end
end

function DefaultServerConfig()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = LSPKeymaps,
    flags = {
      debounce_text_changes = 500,
    }
  }
end
