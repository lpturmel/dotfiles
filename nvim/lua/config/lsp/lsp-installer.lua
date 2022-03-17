local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("config.lsp.handler").on_attach,
		capabilities = require("config.lsp.handler").capabilities,
	}
	 if server.name == "jsonls" then
	 	local jsonls_opts = require("config.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("config.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "rust_analyzer" then
	 	local rust_opts = require("config.lsp.settings.rust_analyzer")
	 	opts = vim.tbl_deep_extend("force", rust_opts, opts)
	 end
	server:setup(opts)
end)
