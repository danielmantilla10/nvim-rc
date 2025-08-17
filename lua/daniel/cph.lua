function map (mode , lhs , rhs , opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend ("force" , options , opts)
	end
	vim.api.nvim_set_keymap (mode , lhs , rhs , options)
end

--<F9> in normal mode to test
map ("n" , "<F9>" , [[:!echo ''%:p:r''\n'/home/daniel/.config/nvim/lua/cph/test'\n'' | cat | python3 /home/daniel/.config/nvim/lua/cph/grader/checker.py <CR>]] , {silent = true})
--map ("n" , ":cpt" , ":!python3 ~/oj/grader/checker.py<CR>'%:p:r' /home/daniel/cp/test/")
--hasta aqui funciona :0

map ("n" , "<F10>" , ":vsplit<CR>:e~/.config/nvim/lua/cph/test/temp<CR>:term ~/.config/nvim/lua/cph/test/./main -res<CR>i" , {silent = true})
map ("n" , "<F11>" , ":vsplit<CR>:e~/.config/nvim/lua/cph/test/temp<CR>:term ~/.config/nvim/lua/cph/test/./main -nor<CR>i" , {silent = true})
