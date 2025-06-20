local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local blink_capabilities = require('blink.cmp').get_lsp_capabilities()


local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = blink_capabilities,
    }, _config or {})
end


lspconfig.zls.setup(config {})
lspconfig.gopls.setup(config {})
lspconfig.omnisharp.setup(config {})
-- lspconfig.wgsl_analyzer.setup(config {})
lspconfig.ts_ls.setup(config(require "config.lsp.settings.ts_ls"))

vim.lsp.config.hulkls = {
    cmd = { 'hulkls' },
    filetypes = { 'json' },
    -- root_dir = lspconfig.util.root_pattern('main.json'),
    root_markers = { 'main.json' },
    capabilities = blink_capabilities,
}

vim.lsp.enable('hulkls')

vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    capabilities = blink_capabilities,
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.lsp.enable('lua_ls')

lspconfig.ocamllsp.setup(config {})
lspconfig.jsonls.setup(config({
    init_options = {
        provideFormatter = true
    }
}))
lspconfig.astro.setup(config {})
lspconfig.graphql.setup(config {})
lspconfig.bashls.setup(config {})
lspconfig.sourcekit.setup(config {})
lspconfig.svelte.setup(config {})
lspconfig.bicep.setup(config {})
lspconfig.html.setup(config {})
lspconfig.marksman.setup(config {})
lspconfig.prismals.setup(config {})
lspconfig.tailwindcss.setup(config {
    filetypes = { "html", "javascript", "typescript", "typescriptreact", "rust" },
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre",
    {
        pattern = { "*.json", "*.ts", "*.lua", "*.tsx", "*.rs", "*.svelte", "*.bicep", "*.cs" },
        callback = function()
            vim.lsp.buf.format({
                timeout_ms = 3000,
                buffer = buf,
            })
        end
    })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        -- local bufnr = args.buf
        -- local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
        --
        -- local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
        end, { buffer = 0 })

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, { buffer = 0 })

        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, { buffer = 0 })

        vim.keymap.set("n", "gi", function()
            vim.lsp.buf.implementation()
        end, { buffer = 0 })

        vim.keymap.set("n", "<C-k>", function()
            vim.lsp.buf.signature_help()
        end, { buffer = 0 })

        vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
        end, { buffer = 0 })

        vim.keymap.set('n', '<space>rn', function()
            vim.lsp.buf.rename()
        end, { buffer = 0 })

        vim.keymap.set('n', '<space>ca', function()
            vim.lsp.buf.code_action()
        end, { buffer = 0 })

        vim.keymap.set('n', '<space>h', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { buffer = 0 })

        vim.keymap.set(
            "n",
            "gl",
            function()
                vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })
            end, { buffer = 0 })

        vim.keymap.set("n", "<C-s>", function()
            vim.diagnostic.open_float()
        end, { buffer = 0 })

        vim.keymap.set("n", "<leader>q", function()
            vim.diagnostic.setloclist()
        end, { buffer = 0 })
    end
})

require("config.lsp.handler").setup()

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
