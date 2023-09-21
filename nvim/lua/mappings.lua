-- Disables
vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { noremap = true });
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { noremap = true });
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { noremap = true });
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { noremap = true });
-- Keymaps
vim.api.nvim_set_keymap('', 'gf :edit', '<cfile><cr>', {})
vim.api.nvim_set_keymap('n', '<S-C-p>', '"0p', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>t', '<Plug>PlenaryTestFile', { noremap = false, silent = false })

-- Delete without yank
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })

-- Increment/decrement
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true })

-- Delete a word backwards
vim.api.nvim_set_keymap('n', 'dw', 'vb"_d', { noremap = true })

-- Select all
vim.api.nvim_set_keymap('n', '<C-a>', 'gg<S-v>G', {})

-- Save with root permissions
vim.cmd('command! W w !sudo tee > /dev/null %')

-- Tabs
vim.api.nvim_set_keymap('n', 'te', ':tabedit', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprev<Return>', {})
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<Return>', {})

-- Windows
-- Split window
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', {})
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', {})

-- Move window
vim.api.nvim_set_keymap('n', '<Space>', '<C-w>w', {})
vim.api.nvim_set_keymap('', 's<Left>', '<C-w>h', {})
vim.api.nvim_set_keymap('', 's<Up>', '<C-w>k', {})
vim.api.nvim_set_keymap('', 's<Down>', '<C-w>j', {})
vim.api.nvim_set_keymap('', 's<Right>', '<C-w>l', {})
vim.api.nvim_set_keymap('', 'sh', '<C-w>h', {})
vim.api.nvim_set_keymap('', 'sk', '<C-w>k', {})
vim.api.nvim_set_keymap('', 'sj', '<C-w>j', {})
vim.api.nvim_set_keymap('', 'sl', '<C-w>l', {})

-- Resize window
vim.api.nvim_set_keymap('n', '<C-w><Left>', '<C-w><', {})
vim.api.nvim_set_keymap('n', '<C-w><Right>', '<C-w>>', {})
vim.api.nvim_set_keymap('n', '<C-w><Up>', '<C-w>+', {})
vim.api.nvim_set_keymap('n', '<C-w><Down>', '<C-w>-', {})


-- Remap tag stack go back from definition
vim.api.nvim_set_keymap('n', 'gb', '<C-t>', {})
