return {
    -- Status bar
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- LSP
    'nvim-treesitter/playground',
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'folke/lsp-colors.nvim',
    'onsails/lspkind-nvim',
    'tjdevries/nlua.nvim',
    'euclidianAce/BetterLua.vim',
    -- Utils
    'nvim-lua/popup.nvim',
    'windwp/nvim-autopairs',
    'chrisbra/Colorizer',
    'tpope/vim-surround',
    -- 'github/copilot.vim',
    -- Comment
    'JoosepAlviste/nvim-ts-context-commentstring',
    -- Themes
    { "catppuccin/nvim", as = "catppuccin" },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
    }
}
