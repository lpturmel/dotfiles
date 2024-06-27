return {
    {
        "rayliwell/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue',
                    'tsx', 'jsx',
                    'rust',
                    'php',
                    'markdown',
                    'astro', 'glimmer', 'handlebars', 'hbs' }
            })
        end,
    },
}
