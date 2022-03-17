local ok, neogit = pcall(require, "neogit")
if not ok then
  return
end

neogit.setup {
    integrations = {
        diffview = true
    }
}

-- Keymaps
vim.api.nvim_set_keymap('n', '<space>vv', '<cmd>DiffviewOpen<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>gs', '<cmd> Neogit <CR>', { noremap = true, silent = true })


