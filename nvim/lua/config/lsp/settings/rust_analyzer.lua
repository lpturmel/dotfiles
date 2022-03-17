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
