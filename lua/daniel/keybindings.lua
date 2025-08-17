--mapeos

function map (mode , lhs , rhs , opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend ("force" , options , opts)
	end
	vim.api.nvim_set_keymap (mode , lhs , rhs , options)
end

vim.g.mapleader = " "

--moverse entre buffers
map ("n" , "<leader>bn" , ":bnext<CR>")
map ("n" , "<leader>bp" , ":bprevious<CR>")
--mapeos

vim.g.mapleader = " "

--moverse entre buffers
map ("n" , "<leader>bn" , ":bnext<CR>")
map ("n" , "<leader>bp" , ":bprevious<CR>")

map ("n" , ":vs<CR>" , ":vsplit<CR>")
map ("n" , ":hs<CR>" , ":split<CR>")

--indentar texto seleccionado
map ("v" , ">" , ">gv")
map ("v" , "<" , "<gv")

map ("n" , "<C-h>" , "<C-w>h")
map ("n" , "<C-j>" , "<C-w>j")
map ("n" , "<C-k>" , "<C-w>k")
map ("n" , "<C-l>" , "<C-w>l")

map ("n" , "<C-Left>" , ":vertical resize +3<CR>")
map ("n" , "<C-Right>" , ":vertical resize -3<CR>")

map ("n" , "<C-e>" , ":25Lex<CR>")

map ("i" , "'" , "''<left>")
map ("i" , "(" , "()<left>")
map ("i" , "{" , "{}<left>")
map ("i" , "[" , "[]<left>")
map ("i" , [["]] , [[""<left>]])
vim.cmd ([[:inoremap {<CR> {<CR><Tab><CR>}<Up><Esc>$a<backspace>]])
--xd no se lo que paso, pero si pongo mi shortcut de autocomplete de las "{" aqui no funciona, se quedara en el config.lua supongo xdddd

--usar cc para borrar una linea
map ("n" , "cc" , [[V"_di]])
map ("v" , "c" , [["_di]])

map ("n" , ":r" , [[:source ~/.config/nvim/init.lua<CR>]])

--map ("v" , " r" , ":\*hy:%s/<C-r>h//g<Left><Left>")

--map ("v" , " r" , ":\*hy:%s/<C-r>h//g<Left><Left>")

--Mapear las flechas del teclado para que no hagan nada, asi usare mas hjkl
map ("n" , "<up>" , "") ;
map ("v" , "<up>" , "") ;
map ("i" , "<up>" , "") ;

map ("n" , "<down>" , "") ;
map ("v" , "<down>" , "") ;
map ("i" , "<down>" , "") ;

map ("v" , "<left>" , "") ;
map ("v" , "<right>" , "") ;

map ("i" , "<left>" , "") ;
map ("i" , "<right>" , "") ;

map ("n" , "<left>" , "") ;
map ("n" , "<right>" , "") ;

--compilar y ejecutar facilmente xd
map ("n" , "<F5>" , [[:vsplit<CR>
:term g++ % -o a -Wall ; and echo "Compilado exitosamente [+]" ; ./a or echo "Compilation Failed [-]" <CR>i]])

map ("n" , "<F6>" , [[:vsplit<CR>
:term ./a ; or echo "Execution Failed [-]" <CR>i]])

--map ("v" , " r" , ":\*hy:%s/<C-r>h//g<Left><Left>")

--map ("v" , " r" , ":\*hy:%s/<C-r>h//g<Left><Left>")

--tabs
map ("n" , ":tn<CR>" , ":tabnew<CR>")
map ("n" , ":tx<CR>" , ":tabclose<CR>")
map ("n" , "<leader>tm" , ":tabmove<CR>")
map ("n" , "<leader>t<" , ":tabmove -1<CR>")
map ("n" , "<leader>t>" , ":tabmove +1<CR>")
map ("n" , "<leader>tn" , ":tabnext<CR>")

--Comentar en C++
map ("n" , "<C-c>" , "^i//<Esc>") ;
