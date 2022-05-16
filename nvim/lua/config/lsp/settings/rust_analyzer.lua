-- Set format on save

vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*.rs", callback = function ()
    vim.lsp.buf.formatting_sync()
end})
local opts = {
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            diagnostics = {
                disabled = { "macro-error" }
            }
        }
    }
}
return opts
