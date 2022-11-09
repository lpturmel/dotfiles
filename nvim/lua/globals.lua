-- Global functions
P = function(s)
    print(vim.inspect(s))
    return s
end
-- Vim global options
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.markdown_fenced_languages = { 'html', 'javascript', 'typescript', 'lua', 'vim', 'rust', 'go' }
