return {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
        local opts = { noremap = true, silent = true }
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "rust" },
            callback = function()
                vim.keymap.set("n", "<space>co", function()
                    vim.cmd.RustLsp('openCargo')
                end, opts)
            end
        })

        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                        assist = {
                            importGranularity = "module",
                            importPrefix = "by_self",
                        },
                        cargo = {
                            loadOutDirsFromCheck = true
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                leptos_macro = {
                                    -- optional: --
                                    -- "component",
                                    "server",
                                },
                            },
                        }
                    },
                }
            }
        }
    end
}
