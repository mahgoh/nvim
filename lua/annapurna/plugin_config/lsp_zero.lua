require('fidget').setup()
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ansiblels',
    'astro',
    'bashls',
    'clangd',
    'dockerls',
    'gopls',
    'grammarly',
    'html',
    'java_language_server',
    'jsonls',
    'lua_ls',
    'marksman',
    'rust_analyzer',
    'sqlls',
    'tailwindcss',
    'tsserver',
    'typst_lsp',
    'yamlls'
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,
    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
    end
  },
})

vim.filetype.add({
  extension = {
    astro = "astro",
    typst = "typ",
  },
})

local luasnip = require("luasnip")
local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("typescript", { "tsdoc" })
require("luasnip").filetype_extend("javascript", { "jsdoc" })
require("luasnip").filetype_extend("lua", { "luadoc" })
require("luasnip").filetype_extend("rust", { "rustdoc" })
require("luasnip").filetype_extend("java", { "javadoc" })
require("luasnip").filetype_extend("c", { "cdoc" })
require("luasnip").filetype_extend("cpp", { "cppdoc" })
require("luasnip").filetype_extend("sh", { "shelldoc" })

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = true
})
