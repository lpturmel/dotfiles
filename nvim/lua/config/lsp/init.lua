local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end
local nvim_lsp_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not nvim_lsp_ok then
    return
end

local default_capabilities = vim.lsp.protocol.make_client_capabilities()
default_capabilities.textDocument.completion.completionItem.snippetSupport = true

local configs = require 'lspconfig.configs'

configs.hulkls = {
    default_config = {
        cmd = { 'hulkls' },
        root_dir = lspconfig.util.root_pattern('main.json'),
        filetypes = { 'json' }
    },
}

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = default_capabilities,
        -- on_attach = function()
            -- local opts = { noremap = true, silent = true }
            --
            -- vim.keymap.set("n", "gD", function()
            --     vim.lsp.buf.declaration()
            -- end, opts)
            --
            -- vim.keymap.set("n", "gd", function()
            --     vim.lsp.buf.definition()
            -- end, opts)
            --
            -- vim.keymap.set("n", "K", function()
            --     vim.lsp.buf.hover()
            -- end, opts)
            --
            -- vim.keymap.set("n", "gi", function()
            --     vim.lsp.buf.implementation()
            -- end, opts)
            --
            -- vim.keymap.set("n", "<C-k>", function()
            --     vim.lsp.buf.signature_help()
            -- end, opts)
            --
            -- vim.keymap.set("n", "gr", function()
            --     vim.lsp.buf.references()
            -- end, opts)
            --
            -- vim.keymap.set('n', '<space>rn', function()
            --     vim.lsp.buf.rename()
            -- end, opts)
            --
            -- vim.keymap.set('n', '<space>ca', function()
            --     vim.lsp.buf.code_action()
            -- end, opts)
            --
            -- vim.keymap.set('n', '<space>h', function()
            --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            -- end, opts)
            --
            -- vim.keymap.set('n', '[d', function()
            --     vim.diagnostic.goto_prev({ border = "rounded" })
            -- end, opts)
            --
            -- vim.keymap.set(
            --     "n",
            --     "gl",
            --     function()
            --         vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })
            --     end, opts)
            -- vim.keymap.set("n", "<C-s>", function()
            --     vim.diagnostic.goto_next({ border = "rounded" })
            -- end, opts)
            --
            -- vim.keymap.set("n", "<leader>q", function()
            --     vim.diagnostic.setloclist()
            -- end, opts)
        -- end
    }, _config or {})
end

lsp_installer.setup({
    ensure_installed = {
        "jsonls",
        "rust_analyzer",
        "ts_ls",
        "astro",
        "tailwindcss",
        "bashls",
        "svelte",
        "gopls",
    },
})

lspconfig.gopls.setup(config {})
lspconfig.ts_ls.setup(config(require "config.lsp.settings.ts_ls"))
-- lspconfig.lua_ls.setup(config({
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- }))

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

lspconfig.prismals.setup(config {})

lspconfig.tailwindcss.setup(config {
    filetypes = { "html", "javascript", "typescript", "typescriptreact", "rust" },
})

lspconfig.hulkls.setup(config {
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre",
    {
        pattern = { "*.json", "*.ts", "*.lua", "*.tsx", "*.rs", "*.svelte", "*.bicep" },
        callback = function()
            vim.lsp.buf.format({
                timeout_ms = 3000,
                buffer = buf,
            })
        end
    })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local file = vim.api.nvim_buf_get_name(buf)

        vim.fn.jobstart({ "leptosfmt", file }, {
            on_exit = function(_, exit_code)
                if exit_code == 0 then
                    vim.api.nvim_command("edit")
                end
            end
        })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        -- local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

        local opts = { noremap = true, silent = true }

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

        vim.keymap.set('n', '[d', function()
            vim.diagnostic.goto_prev({ border = "rounded" })
        end, { buffer = 0 })

        vim.keymap.set(
            "n",
            "gl",
            function()
                vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })
            end, { buffer = 0 })
        vim.keymap.set("n", "<C-s>", function()
            vim.diagnostic.goto_next({ border = "rounded" })
        end, { buffer = 0 })

        vim.keymap.set("n", "<leader>q", function()
            vim.diagnostic.setloclist()
        end, { buffer = 0 })
    end
})

require("config.lsp.handler").setup()
