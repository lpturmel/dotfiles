local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("config.lsp.handler").on_attach,
        capabilities = require("config.lsp.handler").capabilities,
    }
    if server.name == "jsonls" then
        local jsonls_opts = require("config.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("config.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end



    if server.name == "rust_analyzer" then
        local rust_opts = require("config.lsp.settings.rust_analyzer")
        opts = vim.tbl_deep_extend("force", rust_opts, opts)
    end
    -- JS stuff
    if server.name == "tsserver" then
        local ts_opts = require("config.lsp.settings.tsserver")
        opts = vim.tbl_deep_extend("force", ts_opts, opts)
    end
    if server.name == "denols" then
        local deno_opts = require("config.lsp.settings.denols")
        opts = vim.tbl_deep_extend("force", deno_opts, opts)
    end

    server:setup(opts)
end)
