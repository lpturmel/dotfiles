local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end
nvimtree.setup {
    auto_close = true,
    diagnostics = {
        enable = true,
    },
    view = {
        auto_resize = true
    },
}
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})
