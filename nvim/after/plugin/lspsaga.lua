local ok, saga = pcall(require, "lspsaga")
if not ok then
  return
end

saga.init_lsp_saga {
  error_sign = '►',
  warn_sign = '►',
  hint_sign = '►',
  infor_sign = '►',
  border_style = "round",
}
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc() <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-K>', '<cmd>lua require("lspsaga.signaturehelp").signature_help() <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder() <CR>', {noremap = true, silent = true})
