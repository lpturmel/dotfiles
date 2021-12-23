local ok, harpoon = pcall(require, 'harpoon')
if not ok then
  return
end

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
vim.api.nvim_set_keymap('n', 'hm', '<cmd>lua require("harpoon.mark").add_file()<cr>', { noremap = true  })

-- Menu
vim.api.nvim_set_keymap('n', 'hf', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true  })

-- Navigation
vim.api.nvim_set_keymap('n', 'hk', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { noremap = true  })
vim.api.nvim_set_keymap('n', 'hj', '<cmd>lua require("harpoon.ui").nav_next()<cr>', { noremap = true  })

