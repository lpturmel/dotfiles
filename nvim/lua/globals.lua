--
P = function(s)
    print(vim.inspect(s))
    return s
end

-- Globals
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g.markdown_fenced_languages = { 'html', 'javascript', 'typescript', 'lua', 'vim', 'rust', 'go' }
