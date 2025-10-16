return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	lazy = false,
	config = function()
		local treesitter_parsers = require("nvim-treesitter.parsers")
		local treesitter_configs = require("nvim-treesitter.configs")

		treesitter_configs.setup({
			ensure_installed = {
				"rust",
				"typescript",
				"javascript",
				"tsx",
				"json",
				"yaml",
				"html",
				"css",
				"bash",
				"lua",
				"bicep",
				"svelte",
				"go",
				"c",
				"c_sharp",
				"cpp",
			},
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = false,
				disable = {},
			},
		})

		local parser_config = treesitter_parsers.get_parser_configs()
		parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

		-- local parsers
		-- parser_config.compile = {
		--     install_info = {
		--         url = "/home/lpturmel/dev/compilesh/iac/treesitter",
		--         files = { "src/parser.c" },
		--         generate_requires_npm = false,          -- set true if you want :TSInstall to run `tree-sitter generate`
		--         requires_generate_from_grammar = false, -- set true if you ship only grammar.js and not src/parser.c
		--     },
		--     filetype = "compile",
		-- }

		vim.filetype.add({
			extension = { cpl = "compile" },
			filename = { ["CompileLanguage"] = "compile" },
		})
	end,
}
