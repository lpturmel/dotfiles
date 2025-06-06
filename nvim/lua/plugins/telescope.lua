return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', ';f', builtin.find_files, {})
        vim.keymap.set('n', ';r', builtin.live_grep, {})
        vim.keymap.set('n', ';e', builtin.diagnostics, {})
        vim.keymap.set('n', ';b', builtin.buffers, {})
        vim.keymap.set('n', ';;', builtin.help_tags, {})

        local actions = require('telescope.actions')

        telescope.setup {
            defaults = {
                file_ignore_patterns = { "node_modules/*", ".png", ".jpg", ".jpeg", ".tmx", ".wav", ".mp3", ".mp4" },
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                },
            }
        }
    end
}
