local ok, ls = pcall(require, 'luasnip')
if not ok then
  return
end


ls.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChangedI",
}
require("luasnip/loaders/from_vscode").lazy_load()
ls.snippets = {
    all = {},
    typescriptreact = {
        ls.parser.parse_snippet("rfc", "Test :)"),
        ls.parser.parse_snippet("sc", "import { Component } from 'solid-js';\n\nconst $1: Component = (props) => {\nreturn (\n\t\t<div>$2</div>\n\t);\n};\n\nexport default $1;")
    }
}

vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>', {})
