local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Status bar
  use 'kyazdani42/nvim-web-devicons'    
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'ful1e5/onedark.nvim' 
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'cohama/lexima.vim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use {'tami5/lspsaga.nvim', { branch = 'nvim51' }}
  use 'folke/lsp-colors.nvim'
  use 'L3MON4D3/LuaSnip'
  use {'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }}
  use 'onsails/lspkind-nvim'    
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'windwp/nvim-autopairs'
  use 'chrisbra/Colorizer'
  use 'tpope/vim-surround'
  use 'github/copilot.vim'
  -- Completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- Comment
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'terrortylor/nvim-comment'
  -- Post install (yarn install | npm install) then load usein only for editing supported files
  use {'prettier/vim-prettier', { run = 'yarn install --frozen-lockfile --production' }}
  use 'dense-analysis/ale'
  -- File Navigation
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  end)
