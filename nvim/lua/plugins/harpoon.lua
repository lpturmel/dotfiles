return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require("harpoon")
        local m = require("harpoon.mark")
        local ui = require("harpoon.ui")
            
        
        harpoon.setup({
            global_settings = {
                save_on_toggle = false,
                save_on_change = true,
                enter_on_sendcmd = false,
                tmux_autoclose_windows = false,
                excluded_filetypes = { "harpoon" }
            }
        })

        -- Mark
        -- vim.keymap.set('n', '\'m', '<cmd>lua require("harpoon.mark").add_file()<cr>', { noremap = true  })
        vim.keymap.set('n', '\'m', m.add_file, {})

        -- Menu
        -- vim.keymap.set('n', '\'f', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true  })
        vim.keymap.set('n', '\'f', ui.toggle_quick_menu, {})

        -- Navigation
        -- vim.keymap.set('n', '\'k', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { noremap = true  })
        vim.keymap.set('n', '\'k', ui.nav_prev, {})
        vim.keymap.set('n', '\'j', ui.nav_next, {})

    end
}
