local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

vim.api.nvim_set_keymap('n', ';f', '<cmd>lua require("telescope.builtin").find_files() <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';r', '<cmd>lua require("telescope.builtin").live_grep() <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';b', '<cmd>lua require("telescope.builtin").file_browser() <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';e', '<cmd> Telescope diagnostics <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\\\', '<cmd> Telescope buffers <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';;', '<cmd> Telescope help_tags <cr>', {noremap = true, silent = true})

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local actions = require('telescope.actions')

telescope.setup{
  defaults = {
      file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
