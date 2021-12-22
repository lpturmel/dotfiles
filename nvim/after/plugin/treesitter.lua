local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

local treesitter_parsers = require("nvim-treesitter.parsers")
local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "tsx",
    "toml",
    "json",
    "yaml",
    "html",
    "rust"
  },
}

local parser_config =  treesitter_parsers.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
