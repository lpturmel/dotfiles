return {
    'everviolet/nvim',
    name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    config = function()
        require('evergarden').setup({
            theme = {
                variant = 'winter',
                accent = 'green',
            },
            editor = {
                transparent_background = true,
            },
            style = {
                tabline = { 'reverse' },
                search = { 'italic', 'reverse' },
                incsearch = { 'italic', 'reverse' },
                types = {},
                keyword = {},
                comment = { 'italic' },
            },
            overrides = {},
            color_overrides = {},
        })
    end
}
