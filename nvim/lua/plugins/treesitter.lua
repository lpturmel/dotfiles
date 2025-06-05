return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local treesitter_parsers = require("nvim-treesitter.parsers")
        local treesitter_configs = require("nvim-treesitter.configs")

        treesitter_configs.setup {
            ensure_installed = { "rust", "typescript", "javascript", "tsx", "json", "yaml", "html", "css", "bash", "lua",
                "bicep", "svelte", "go", "c", "c_sharp", "cpp" },
            highlight = {
                enable = true,
                disable = {},
            },
            indent = {
                enable = false,
                disable = {},
            },
        }

        local parser_config = treesitter_parsers.get_parser_configs()
        parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
    end
}
