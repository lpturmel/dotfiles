-- Options
local opts = vim.o

vim.cmd("set splitright")

opts.encoding = "utf-8"
opts.number = true
opts.relativenumber = true
opts.title = true
opts.autoindent = true
opts.backup = false
opts.hlsearch = true
opts.showcmd = true
opts.cmdheight = 1
opts.laststatus = 2
opts.scrolloff = 10
opts.sidescrolloff = 10
opts.expandtab = false
opts.backupskip = "/tmp/*,/private/tmp/*"
opts.inccommand = "split"
opts.scrollbind = false
opts.ruler = false
opts.showmatch = false
-- opts.lazyredraw = true
opts.ignorecase = true
opts.smarttab = true
opts.shiftwidth = 4
opts.tabstop = 4
opts.autoindent = true
opts.smartindent = true
opts.wrap = false
opts.cursorline = true
opts.suffixesadd =
".c,.cpp,.h,.hpp,.hxx,.m,.mm,.php,.py,.rb,.sh,.swift,.yml,.yaml,.rust,.json,.js,.jsx,.ts,.tsx,.css,.md,.es,.pl,.svelte,.astro"
opts.exrc = true
opts.hidden = true
opts.list = false
opts.winborder = "rounded"

local function first_bin(paths)
	for _, p in ipairs(paths) do
		if vim.fn.executable(p) == 1 then
			return p
		end
	end
end

local uname = vim.loop.os_uname().sysname
local shell

if uname == "Darwin" then
	shell = first_bin({ "/opt/homebrew/bin/fish", "/usr/local/bin/fish", "/bin/zsh" })
else
	shell = first_bin({ "/bin/zsh", "/usr/bin/zsh", "/usr/bin/fish" })
end

if shell then
	vim.o.shell = shell
	if shell:find("fish", 1, true) then
		vim.o.shellcmdflag = "-lc"
	else
		vim.o.shellcmdflag = "-lc"
	end
end
