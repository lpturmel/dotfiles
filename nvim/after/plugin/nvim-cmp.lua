local ok, luasnip = pcall(require,"luasnip")
if not ok then
  return
end
local lspkind = require("lspkind")

-- -- Set completeopt to have a better completion experience
vim.opt.completeopt = {"menuone", "noinsert", "noselect" }

lspkind.init()

local cmp = require "cmp"
cmp.setup({
    performance = {
        debounce = 150,
    },
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
      { name = "nvim_lua" },
      { name = "nvim_lsp", max_item_count = 20 },
      { name = "path" },
      -- { name = "luasnip", max_item_count = 5 },
      { name = "buffer", keyword_length = 5 }
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = lspkind.presets.default[vim_item.kind]
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
    ghost_text = true,
    native_menu = false,
  },
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
