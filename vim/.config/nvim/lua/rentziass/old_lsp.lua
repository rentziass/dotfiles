-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- lsp-install
local function setup_servers()
  local servers = { 'gopls', 'sumneko_lua', 'tsserver', 'yamlls', 'rust_analyzer' }

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == 'gopls' then
      config.settings = {
        gopls = {
          usePlaceholders = true,
          gofumpt = true,
          semanticTokens = true,
        }
      }
    end
    if server == 'sumneko_lua' then
      config.settings = lua_settings
    end
    if server == 'sourcekit' then
      config.filetypes = {'swift', 'objective-c', 'objective-cpp'}; -- we don't want c and cpp!
    end
    if server == 'clangd' then
      config.filetypes = {'c', 'cpp'}; -- we don't want objective-c and objective-cpp!
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--
--     if server.name == 'gopls' then
--       opts.settings = {
--         gopls = {
--           usePlaceholders = true,
--           gofumpt = true,
--           semanticTokens = true,
--         }
--       }
--     end
--
--     if server.name == 'sumneko_lua' then
--       opts.settings = lua_settings
--     end
--
--     if server.name == 'sourcekit' then
--       opts.filetypes = {'swift', 'objective-c', 'objective-cpp'}; -- we don't want c and cpp!
--     end
--
--     if server.name == 'clangd' then
--       opts.filetypes = {'c', 'cpp'}; -- we don't want objective-c and objective-cpp!
--     end
--
--     if server.name == 'yamlls' then
--       opts.settings = {
--         yaml = {
--           schemas = {
--             url = "globPattern",
--             kubernetes = "globPattern"
--           }
--         }
--       }
--     end
--
--     -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     --     opts.root_dir = function() ... end
--     -- end
--
--     -- This setup() function is exactly the same as lspconfig's setup function.
--     -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--     server:setup(opts)
-- end)

------ GO ------
