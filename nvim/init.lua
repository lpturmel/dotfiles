vim.o.encoding = 'utf-8'
-- Option not available in Neovim ???
-- vim.api.nvim_set_option('nocompatible', true)
vim.o.number = true
vim.o.relativenumber = true
vim.o.title = true
vim.o.autoindent = true
vim.o.backup = false
vim.o.hlsearch = true
vim.api.nvim_set_option('hlsearch', true)
vim.api.nvim_set_option('showcmd', true)
vim.api.nvim_set_option('cmdheight', 1)
vim.api.nvim_set_option('laststatus', 2)
vim.api.nvim_set_option('scrolloff', 10)
vim.api.nvim_set_option('sidescrolloff', 10)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('backupskip', '/tmp/*,/private/tmp/*')
-- Neovim specific
vim.api.nvim_set_option('inccommand', 'split')
--
-- Not available in neomvim
-- vim.api.nvim_set_option('t_BE', nil)
vim.api.nvim_set_option('scb', false)
vim.api.nvim_set_option('ru', false)
vim.api.nvim_set_option('showmatch', false)
vim.api.nvim_set_option('lazyredraw', true)
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smarttab', true)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('ai', true)
vim.api.nvim_set_option('si', true)
vim.api.nvim_set_option('wrap', false)
vim.api.nvim_set_option('cursorline', true)
vim.api.nvim_set_option('suffixesadd', '.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md')
vim.api.nvim_set_option('exrc', true)
vim.api.nvim_set_option('hidden', true)

-- Colors
vim.api.nvim_set_option('background', "dark")
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('winblend', 0)
vim.api.nvim_set_option('wildoptions','pum')
vim.api.nvim_set_option('pumblend', 5)
vim.cmd('colorscheme onedark')

-- Globals
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0

-- Plugin config
require('plugins')

-- Mappings config
require('mappings')
