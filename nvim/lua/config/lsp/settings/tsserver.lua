local ok, nvim_lsp = pcall(require, "lspconfig")
if not ok then
  return
end


local opts = {
    root_dir = nvim_lsp.util.root_pattern("package.json"),
}

return opts
