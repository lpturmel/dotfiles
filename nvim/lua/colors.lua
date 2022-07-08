-- Colors
-- vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.winblend = 0
vim.o.wildoptions = 'pum'
vim.o.pumblend = 5

local ok = pcall(require, "packer")

if ok then
    -- Fix the floating color for nordfox theme
    -- vim.cmd('colorscheme nordfox')
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#2D3441' })
    --
    -- Fix the floating color for gruvbox theme
    vim.cmd('colorscheme tokyonight')
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#282828' })
    
end

