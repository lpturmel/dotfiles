local ok, cp = pcall(require, "catppuccin")
if not ok then return end

local flavour = "mocha"
vim.g["catppuccin_flavour"] = flavour

cp.setup{
    transparent_background = true,
    term_colors = true,
    styles = {
        floats = "transparent",
        sidebars = "transparent",
    },
}

vim.cmd("colorscheme catppuccin")
