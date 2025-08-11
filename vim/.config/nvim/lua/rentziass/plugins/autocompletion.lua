return {
  {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-vsnip',
    },
    event = "InsertEnter",
    config = function()
      local cmp = require "cmp"
      local lspkind = require "lspkind"

      cmp.setup {
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = false,
            },
            { "i", "c" }
          ),

          ["<c-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
                _ --[[fallback]]
            )
              if cmp.visible() then
                if not cmp.confirm { select = true } then
                  return
                end
              else
                cmp.complete()
              end
            end,
          },

          -- Testing
          ["<c-q>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },

          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<Down>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ["<Up>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        },

        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "orgmode" },
          { name = "path" },
          { name = "buffer",  keyword_length = 5 },
          { name = "nvim_lua" },
        },

        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },

        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
              gh_issues = "[issues]",
              tn = "[TabNine]",
            },
          },
        },

        experimental = {
          -- Let's play with this for a day or two
          ghost_text = true,
        },
      }

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        -- mapping = cmp.mapping.preset.insert({
        --   ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- }),
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline', keyword_length = 5 }
        })
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- local servers = { 'gopls', 'lua_ls', 'ts_ls', 'yamlls', 'rust_analyzer' }
      -- for _, server in pairs(servers) do
      --   require('lspconfig')[server].setup {
      --     capabilities = capabilities
      --   }
      -- end
    end
  },
}
