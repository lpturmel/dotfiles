local ok, t_ctx = pcall(require, "treesitter-context")
if not ok then
  return
end

t_ctx.setup {
  enable = true,
}
