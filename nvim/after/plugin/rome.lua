
vim.api.nvim_create_autocmd("BufWritePre", { pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" }, callback = function ()
    vim.cmd(":silent execute '!npx rome format % --write' | edit!")
end})
