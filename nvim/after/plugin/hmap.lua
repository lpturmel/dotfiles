local ok, _ = pcall(require, "hmap")
if not ok then
  return
end

-- Toggle menu
vim.api.nvim_set_keymap('n', '<space>k', '<cmd>lua require("hmap").toggle_window()<cr>', { noremap = true  })
