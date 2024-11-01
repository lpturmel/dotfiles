return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {'williamboman/mason.nvim'},
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "tsserver",
                "sumneko_lua",
                "jsonls",
                "zls",
                "tailwindcss",
                "cssls",
                "html",
                "dockerls",
                "yamlls",
            }
        })
    end
}
