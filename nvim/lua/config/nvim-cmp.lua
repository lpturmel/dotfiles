local ok, luasnip = pcall(require,"luasnip", "nvim-cmp")
if not ok then
  return
end
local lspkind = require("lspkind")

-- -- Set completeopt to have a better completion experience
vim.opt.completeopt = {"menuone", "noinsert", "noselect" }

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      --{ name = "nvim_lua" },
      { name = "path" },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      --vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
   window = {
       documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
   },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
