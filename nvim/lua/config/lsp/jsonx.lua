local M = {}
local api, lsp = vim.api, vim.lsp


function M.start(conf)

    local client_id = lsp.start_client(conf)
    return client_id
end
function M.setup()
    local _default_config = {
        cmd = { "/Users/lpturmel/dev/rust/jsonx/target/release/jsonx" },
    }
    vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.jsonx", callback = function ()
        print("trying to start jsonx lsp server...")
        local client_id = M.start(_default_config)
        print("Trying to attach lsp client to jsonx server...")
        lsp.buf_attach_client(api.nvim_get_current_buf(), client_id)
    end})
end

return M
