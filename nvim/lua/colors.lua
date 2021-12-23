-- Colors
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.winblend = 0
vim.o.wildoptions = 'pum'
vim.o.pumblend = 5
local ok = pcall(require, "packer")
if ok then
    vim.cmd('colorscheme onedark')
end
