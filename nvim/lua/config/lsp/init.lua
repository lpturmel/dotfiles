local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = "*.astro", command = "set filetype=astro"})
lspconfig.astro.setup {}

require("config.lsp.lsp-installer")
require("config.lsp.handler").setup()
require("config.lsp.null-ls")

-- print(require("config.lsp.init").setup())
-- require('nlua.lsp.nvim').setup(lspconfig, {
--   on_attach = require("config.lsp.handler").on_attach,
--   capabilities = require("config.lsp.handler").capabilities,
-- })

