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

-- require("rentziass.lsp.null-ls")

require('lspkind').init({})

require('lspsaga').init_lsp_saga({
  code_action_keys = {
    quit = { 'q', '<esc>', '<C-c>' }, exec = '<CR>'
  },
  rename_action_keys = {
    quit = { '<esc>', '<C-c>' }, exec = '<CR>'
  },
})

-- require('rentziass.lsp.go_tests')
-- require('rentziass.lsp.keymaps')
-- require('rentziass.lsp.server_config')

-- LSP servers configurations
-- require('rentziass.lsp.c#')
-- require('rentziass.lsp.docker')
-- require('rentziass.lsp.golang')
-- require('rentziass.lsp.lua')
-- require('rentziass.lsp.solargraph')
-- require('rentziass.lsp.sorbet')
-- require('rentziass.lsp.rust')
-- require('rentziass.lsp.typescript')
-- require('rentziass.lsp.yaml')
-- require('rentziass.lsp.zig')

-- WIP
-- require('rentziass.lsp.protobuf')


-- KEYMAPS
local builtin = require("telescope.builtin")
local h = require("rentziass.h")

local keymapsGroup = vim.api.nvim_create_augroup("LspMappings", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = keymapsGroup,
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    -- Using LSP defaults
    h.nnoremap("gD", vim.lsp.buf.declaration)
    h.nnoremap("gd", vim.lsp.buf.definition)
    h.nnoremap("<Leader>rn", vim.lsp.buf.rename)
    h.nnoremap("<Leader>td", vim.lsp.buf.type_definition)
    h.nnoremap("K", vim.lsp.buf.hover)
    h.nnoremap("<Leader>K", vim.lsp.buf.signature_help)
    h.nnoremap("<Leader>ca", vim.lsp.buf.code_action)
    h.nnoremap("<Leader>d", function()
      vim.diagnostic.goto_next({ float = { focus = false, border = "rounded" } })
    end)
    h.nnoremap("[d", function()
      vim.diagnostic.goto_prev({ float = { focus = false, border = "rounded" } })
    end)

    -- Using Telescope
    h.nnoremap("<Leader>o", function()
      builtin.lsp_document_symbols({ sort_lastused = true, layout_config = { width = 0.8 }, symbol_width = 50 })
    end)
    h.nnoremap("gr", function()
      builtin.lsp_references({ include_current_line = true })
    end)

    h.nnoremap("gI", builtin.lsp_implementations)

    h.nnoremap("<Leader>D", builtin.diagnostics)

    h.nnoremap("<leader>tt", function()
      local current_file = vim.api.nvim_buf_get_name(0)
      local folder = vim.fn.fnamemodify(current_file, ":h")
      vim.api.nvim_command("silent !zellij run -f -- go test " .. folder)
    end)

    -- Disable virtual diagnostics because they are mostly annoying
    vim.diagnostic.config({ virtual_text = false })

    -- Disable diagnostics for helm buffers
    if vim.bo[opts.buffer].buftype ~= "" or vim.bo[opts.buffer].filetype == "helm" then
      vim.diagnostic.disable(opts.buffer)
      vim.defer_fn(function()
        vim.diagnostic.reset(nil, opts.buffer)
      end, 1000)
    end
  end,
})
