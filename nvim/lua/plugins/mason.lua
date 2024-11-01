return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {'williamboman/mason.nvim'},
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "ts_ls",
                "lua_ls",
                "jsonls",
                "zls",
                "tailwindcss",
                "astro",
                "bicep",
                "cssls",
                "html",
                "marksman",
                "sqlls"

            }
        })
    end
}
