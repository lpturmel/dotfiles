return {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
        local t_ctx = require('treesitter-context')
        t_ctx.setup {
            enable = true,
        }
    end
}
