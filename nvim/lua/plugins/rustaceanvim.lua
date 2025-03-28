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
                vim.keymap.set("n", "<space>od", function()
                    vim.cmd.RustLsp('openDocs')
                end, opts)
            end
        })

        vim.g.rustaceanvim = {
            tools = {
                float_win_config = {
                    border = "rounded",
                }
            },
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        rustfmt = {
                            extraArgs = { "+nightly" },
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                        assist = {
                            importGranularity = "module",
                            importPrefix = "by_self",
                        },
                        cargo = {
                            loadOutDirsFromCheck = true,
                            allFeatures = true,
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
