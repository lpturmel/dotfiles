return {
    'TimUntersberger/neogit',
    dependencies = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
    config = function()
        local neogit = require('neogit')
        neogit.setup {
            integrations = {
                diffview = true
            }
        }
        vim.api.nvim_set_keymap('n', '<space>vv', '<cmd>DiffviewOpen<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>gs', '<cmd> Neogit <CR>', { noremap = true, silent = true })
  end
}
