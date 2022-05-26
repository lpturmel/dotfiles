local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end
nvimtree.setup {
}
vim.api.nvim_set_keymap('n', '<space>b', '<cmd>lua require"nvim-tree".toggle(false, true)<CR>', {noremap = true, silent = true})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { callback = function()
    nvimtree.toggle()
end})
