vim.cmd (':autocmd BufNewFile *.cpp :0r ~/cp/template.cpp')

vim.opt.syntax = on
--vim.g.mapleader = ""

vim.g.netrw_banner = false

vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd (':set clipboard=unnamedplus')
vim.opt.hlsearch = false
vim.cmd (':colorscheme molokai')
--Un indentline, la talla mas calva que he visto en mi vida
vim.cmd ([[:set list lcs=tab:\|\ ]])
vim.opt.cursorline = true
vim.opt.scrolloff = 12

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.path:append ("**")

vim.api.nvim_create_autocmd ("TextYankPost" , {
	callback = function ()
		vim.highlight.on_yank ()
	end,
})

vim.opt.showtabline = 1

--El explorador de archivos
vim.g.netrw_liststyle= 3
vim.g.netrw_winsize = -25

--Barra de estado global en vez de por cada ventana
vim.opt.laststatus = 3

--Se supone q esto mejora el rendimiento
vim.opt.lazyredraw = true
