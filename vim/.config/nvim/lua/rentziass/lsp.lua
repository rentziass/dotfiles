-- keymaps
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
  buf_set_keymap('v', '<space>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
  buf_set_keymap('n', '<leader>dq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

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

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 500,
    }
  }
end

-- lsp-install
local function setup_servers()
  local servers = { 'gopls', 'sumneko_lua', 'tsserver' }

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

------ GO ------
function GoImports(timeout_ms)
  local context = {only = {"source.organizeImports"}}
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
