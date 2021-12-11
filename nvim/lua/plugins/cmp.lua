local cmp = require 'cmp'
local compare = require('cmp.config.compare')
local mapping = require('cmp.config.mapping')
local types = require('cmp.types')

local WIDE_HEIGHT = 40
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}
format = require("lspkind").cmp_format({menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    })}),
cmp.setup({

  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.kind = string.format('%s %s',kind_icons[vim_item.kind], string.sub(vim_item.kind, 0, 2))
      -- Source
      vim_item.menu = ({
        buffer = "Bu",
        nvim_lsp = "Ls",
        luasnip = "Sn",
        nvim_lua = "Lu",
        latex_symbols = "La",
	crates = "Cr"
      })[entry.source.name]
      return vim_item
    end
  },

    documentation = {
      border = { '', '', '', ' ', '', '', '', ' ' },
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
      maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    preselect = types.cmp.PreselectMode.Item,


    confirmation = {
      default_behavior = types.cmp.ConfirmBehavior.Insert,
      get_commit_characters = function(commit_characters)
        return commit_characters
      end,
    },

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
        -- vim.fn["ultisnips#anon"](args.body) -- for `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },

    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'crates' },
      { name = 'path' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'neorg' }, -- For vsnip users.
      { name = 'buffer' },
    })

  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'B' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  --[[ local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities ]]
  -- }


--------- plugin conf

---@return cmp.ConfigSchema
local cnf = function()
  return {
    enabled = function()
      return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
    end,
    completion = {
      autocomplete = {
        types.cmp.TriggerEvent.TextChanged,
      },
      completeopt = 'menu,menuone,noselect',
      keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
    },

    snippet = {
      expand = function()
        error('snippet engine is not configured.')
      end,
    },


    event = {},

    mapping = {
      ['<Down>'] = mapping({
        i = mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
        c = function(fallback)
          local cmp = require('cmp')
          cmp.close()
          vim.schedule(cmp.suspend())
          fallback()
        end,
      }),
      ['<Up>'] = mapping({
        i = mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
        c = function(fallback)
          local cmp = require('cmp')
          cmp.close()
          vim.schedule(cmp.suspend())
          fallback()
        end,
      }),
      ['<Tab>'] = mapping({
        c = function(fallback)
          local cmp = require('cmp')
          if #cmp.core:get_sources() > 0 and not cmp.get_config().experimental.native_menu then
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          else
            fallback()
          end
        end,
      }),
      ['<S-Tab>'] = mapping({
        c = function(fallback)
          local cmp = require('cmp')
          if #cmp.core:get_sources() > 0 and not cmp.get_config().experimental.native_menu then
            if cmp.visible() then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
          else
            fallback()
          end
        end,
      }),
      ['<C-n>'] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<C-p>'] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
      ['<C-y>'] = mapping.confirm({ select = false }),
      ['<C-e>'] = mapping.abort(),
    },
    experimental = {
      native_menu = false,
      ghost_text = false,
    },

    -- sources = {},
  }
end
