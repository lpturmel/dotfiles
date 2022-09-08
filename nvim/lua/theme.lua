local ok, cp = pcall(require, "catppuccin")
if not ok then return end

local flavour = "frappe"
vim.g["catppuccin_flavour"] = flavour

local palette = require"catppuccin.palettes".get_palette(flavour)

cp.setup{}

vim.api.nvim_command('colorscheme catppuccin')
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = palette.base })
