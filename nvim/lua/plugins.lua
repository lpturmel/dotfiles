local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  -- Status bar
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', opt = true}
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons' },
  },
  {"akinsho/toggleterm.nvim"},
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Git
  { 'TimUntersberger/neogit', dependencies = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'} },
  -- LSP
  {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'},
  'folke/lsp-colors.nvim',
  'onsails/lspkind-nvim',
  'tjdevries/nlua.nvim',
  'euclidianAce/BetterLua.vim',
  'simrat39/rust-tools.nvim',
  -- Snippets
  { 'L3MON4D3/LuaSnip', version = "2.*", build = "make install_jsregexp" },
  { 'saadparwaiz1/cmp_luasnip' },
  -- Utils
  {'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
  {'nvim-treesitter/nvim-treesitter-context'},
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'windwp/nvim-autopairs',
  'chrisbra/Colorizer',
  'tpope/vim-surround',
  'github/copilot.vim',
  -- Completion
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  -- Comment
  'JoosepAlviste/nvim-ts-context-commentstring',
  'terrortylor/nvim-comment',
  'ThePrimeagen/harpoon',
  -- Themes
  { "catppuccin/nvim", as = "catppuccin" },
  'onsails/lspkind.nvim'
})
