vim.cmd [[ autocmd BufRead,BufNewFile *.purs set filetype=purescript ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.cr set filetype=crystal ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.ecr set filetype=ecrystal ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.v set filetype=Vlang ]]




vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
