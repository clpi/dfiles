-- KEYMAPS UTILS nvim.n

-- ([
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
	return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
 end

 local default = { noremap = true }
 local silent = { silent= true }
 local noremap = { noremap= true }
 local expr = { noremap = true, expr = true }
local f =   { expr = false, noremap = false, silent = false }
local en =  { expr = true, noremap = true, silent = false }
local e =   { expr = true, noremap = false, silent = false }
local es =  { expr = true, noremap = false, silent = true}
local n =   { expr = false, noremap = true, silent = false}
local ns =  { expr = false, noremap = true, silent = true }
local s =  { expr = false, noremap = false, silent = true }
local ens = { expr = true, noremap = true, silent = true }

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

local function map(mode, key, res, opts)
	return vim.api.nvim_set_keymap(mode, key, res, opts)
end
local function nm(key, res, opts) return map("n", key, res, opts) end
local function vm(key, res, opts) return map("v", key, res, opts) end
local function tm(key, res, opts) return map("t", key, res, opts) end
local function im(key, res, opts) return map("i", key, res, opts) end
local function xm(key, res, opts) return map("x", key, res, opts) end
local function cm(key, res, opts) return map("c", key, res, opts) end
local function nm(key, res, opts) return map("n", key, res, opts) end

-- KEYMAPS
--
--UTILITY
--
nm("U", "<C-r>", s)
nm("U", "<C-r>", s)
nm(":", ";", f)
im("kj", "<ESC>", f)
im("jk", "<ESC>h", f)
nm(';', ':', n)
vm(';', ':', n)


nm("<C-s>", ":w<cr>", s)

-- XXX XXX XXX Neovim Meta commands (,v) XXX XXX XXX
nm("<space>v<space>", "luafile %%<CR>", default)
nm("<space>v,", "luafile ~/.config/lvim/config.lua<CR>", default)


-- [[
-- XXX XXX XXX Just various convenience mappings XXX XXX XXX
nm("<c-j>",  "<c-d>", {})
nm("<c-k>", "<c-u>", {})
vm("<c-j>",  "<c-d>", {})
vm("<c-k>", "<c-u>", {})
im("<c-j>",  "<c-d>", {})
im("<c-k>", "<c-u>", {})

nm("J", "<ESC>:bnext<CR>", default)
nm("K", "<ESC>:bprev<CR>", default)

nm("<space>n", "<ESC>:NvimTreeToggle<CR>", ns)
nm("<space>oe", "<ESC>:NvimTreeToggle<CR>", ns)












-- nm("<space>>") = "<ESC>:BufferLineMoveNext<CR>"
-- nm("<space><") = "<ESC>:BufferLineMovePrevious<CR>"

-- XXX XXX XXX Telescope useful cmds <space><sym> XXX XXX XXX
--nm("<space>ff", "<ESC>:Telescope find_files<CR>")
--nm("<space>fb") = "<ESC>:Telescope buffers<CR>")
--nm("<space>;") = "<ESC>:Telescope cmd_history<CR>")
--nm("<space>/") = "<ESC>:Telescope search_history<CR>")
--nm("<space>fp") = "<ESC>:Telescope projects<CR>")
--nm("<space>g") = "<ESC>:Telescope live_grep<CR>")
--nm("<space>:") = "<ESC>:Telescope commands<CR>")
----nm("<space>f") = "<ESC>:Telescope fd<CR>")
--nm("<space>?") = "<ESC>:Telescope oldfiles<CR>")
--
----nm("<space><space>M") = "<ESC>:Telescope man_pages<CR>")
--nm("<space><space>h") = "<ESC>:Telescope help_tags<CR>")
--nm("<space><space>k") = "<ESC>:Telescope keymaps<CR>")
--nm("<space><space>C") = "<ESC>:Telescope colorscheme<CR>")
--nm("<space><space>m") = "<ESC>:Telescope marks<CR>")
--nm("<space><space>t") = "<ESC>:Telescope tags<CR>" )
--nm("<space><space>j") = "<ESC>:Telescope jumplist<CR>" )
--nm("<space><space>q") = "<ESC>:Telescope quickfix<CR>")
--nm("<space><space>T") = "<ESC>:Telescope ttreesitter<CR>")
--nm("<space><space>g") = "<ESC>:Telescope grep_string<CR>")
----nm("<space><space>G") = "<ESC>:Telescope git_files<CR>")
--nm("<space><space>s") = "<ESC>:Telescope symbols<CR>")
--nm("<space><space>S") = "<ESC>:Telescope spell_suggest<CR>")
--nm("<space><space>l") = "<ESC>:Telescope loclist<CR>"
--nm("<space><space>F") = "<ESC>:Telescope file_browser<CR>"
--nm("<space><space>f") = "<ESC>:Telescope fd<CR>"
--nm("<space><space>c") = "<ESC>:Telescope commands<CR>"
--nm("<space><space><space>") = "<ESC>:Telescope builtins<CR>"

-- Come back to ergonomize these/more comfy aliases
--nm("-wd") = "<ESC>:Telescope lsp_workplace_diagnostics<CR>"
--nm("-dd") = "<ESC>:Telescope lsp_document_diagnostics<CR>"
--nm("-ca") = "<ESC>:Telescope lsp_code_actions<CR>"
--nm("-rca") = "<ESC>:Telescope lsp_code_actions<CR>"
--nm("-i") = "<ESC>:Telescope lsp_implementations<CR>"
--nm("-d") = "<ESC>:Telescope lsp_definitions<CR>"
--nm("-r") = "<ESC>:Telescope lsp_references<CR>"
--nm("-td") = "<ESC>:Telescope lsp_type_definitions<CR>"
--nm("-tr") = "<ESC>:Telescope lsp_type_references<CR>"
--nm("-sd") = "<ESC>:Telescope lsp_document_symbols<CR>"
--nm("-ws") = "<ESC>:Telescope lsp_workspace_symbols<CR>"
--nm("-dws") = "<ESC>:Telescope lsp_dynamic_workplace_symbols<CR>"

--nm("--") = "--"


map('n', 'U', ':redo<CR>', {})
map('n', '0', '$', { noremap = true})
map('n', 'Y', 'y$', { noremap = true})

map('v', '$', 'g_', {noremap = true})
map('x', '$', 'g_', {noremap = true})
map('v', '>', '>gv', default)
map('v', '<', '<gv', default)

map('n', 'J', ':bnext<CR>', default)
map('n', 'K', ':bprev<CR>', default)
map('n', 'H', ':tabprevious<CR>', default)
map('n', 'L', ':tabnext<CR>', default)
-- Resize splits
map('n', '<leader>rh', '5<C-w><', default)
map('n', '<leader>rj', '5<C-w>-', default)
map('n', '<leader>rk', '3<C-w>+', default)
map('n', '<leader>rl', '3<C-w>>', default)
-- Jump to splits
map('n', '<space>h', '<c-w>h', noremap)
map('n', '<space>l', '<c-w>l', noremap)
map('n', '<space>j', '<c-w>j', noremap)
map('n', '<space>k', '<c-w>k', noremap)
map('n', '<leader>wh', '<c-w>h', noremap)
map('n', '<leader>wl', '<c-w>l', noremap)
map('n', '<leader>wj', '<c-w>j', noremap)
map('n', '<leader>wk', '<c-w>k', noremap)
map('n', '<Left>', '<c-w>h', noremap)
map('n', '<right>', '<c-w>l', noremap)
map('n', '<down>', '<c-w>j', noremap)
map('n', '<up>', '<c-w>k', noremap)
-- Easy quit/save mappings
map('n', '<leader>wq',        ':wq!<CR>', default)
map('n', '<leader>q',         ':<C-U>q!<CR>', default)
map('n', '<leader><leader>q', ':<C-U>q!<CR>', default)
map('n', '<leader>Q',         ':qa!<CR>', default)
map('n', '<leader>ww',        ':w!<CR>', default)
map('c', 'w!!',               '%!sudo tee > /dev/null %', default)
map('n', '<leader><tab>',     '<c-$><esc>', default)
-- Move line up/down
map('n', 'mlj', 'mz:m+<cr>`z', default)
map('n', 'mlk', 'mz:m-2<cr>`z', default)
map('v', 'mlj', ":m'>+<cr>`<my`>mzgv`yo`z", default)
map('v', 'mlk', ":m'<-2<cr>`>my`<mzgv`yo`z", default)
-- Set edit modes
map('n', '<leader>sp', ':setlocal pastetoggle<CR>', default)

-- <C-;> (unset)
-- map('n', '<c-;>', ':!', default)

-- <space>; (unset)
map('n', '<leader>;', ':Telescope command_history<cr>', default)
map('n', '<leader>/', ':Telescope search_history<cr>', default)
map('n', '<leader><leader>/', ':%s///gi<left><left><left><left>', { noremap = true })
map('n', '<leader><leader>;', ':Telescope commands<CR>', default)

-- <c-p> Open commands
map('n', '<c-p><c-p>', ':Commands<CR>', default)

-- Tab ops
map ('n', '<leader>tn', ':tabnew<CR>', default)
map ('n', '<leader>td', ':tabclose<CR>', default)
map ('n', '<leader>tc', ':tabclose<CR>', default)
map ('n', '<leader>tm', ':tabmove<CR>', default)
map ('n', '<leader>t1', '1gt', default)
map ('n', '<leader>t2', '2gt', default)
map ('n', '<leader>t3', '3gt', default)
map ('n', '<leader>t4', '4gt', default)
map ('n', '<leader>t5', '5gt', default)
map ('n', '<leader>t6', '6gt', default)
map ('n', '<leader><space>1', '1gt', default)
map ('n', '<leader><space>2', '2gt', default)
map ('n', '<leader><space>3', '3gt', default)
map ('n', '<leader><space>4', '4gt', default)
map ('n', '<leader><space>5', '5gt', default)
map ('n', '<leader><space>6', '6gt', default)

map ('n', '<leader>ee', ':e<Space><c-z>', { noremap = true })

map ('n', '<leader>bb', ':b<Space><c-z>', default)
map ('n', '<leader>bn', ':badd<CR>', default)
map ('n', '<leader>bd', ':Bwipeout<CR>', default) --duplicate contents of buf
map ('n', '<leader>bC', ':bdelete<CR>', default) --duplicate contents of buf
map ('n', '<leader>by', 'ggVGy<ESC><Space>bnp:w', default) --duplicate contents of buf
map ('n', '<leader>bd', ':Bwipeout<CR>', default)
map ('n', '<leader>bd', ':Bdelete<CR>', default)
map ('n', '<leader>bw', ':Bwipeout<CR>', default)

map ('n', '<leader>bp', ':BufferLinePick<CR>', default)
map ('n', '<leader>b>', ':BufferLineMoveNext<CR>', default)
map ('n', '<leader>b<', ':BufferLineMovePrev<CR>', default)
map ('n', 'J',                ':bnext<CR>', default)
map ('n', 'K',                ':bprev<CR>', default)
map ('n', '<leader>bse',      ':BufferLineSortByExtension<CR>', default)
map ('n', '<leader>bsd',      ':BufferLineSortByDirectory<CR>', default)
map ('n', '<leader>bsD',      ':BufferLineSortByRelativeDirectory<CR>', default)

nm('<spc>1', '<Cmd>BufferLineGoToBuffer 1<CR>', s)
nm('<spc>2', '<Cmd>BufferLineGoToBuffer 2<CR>', s)
nm('<spc>3', '<Cmd>BufferLineGoToBuffer 3<CR>', s)
nm('<spc>4', '<Cmd>BufferLineGoToBuffer 4<CR>', s)
nm('<spc>5', '<Cmd>BufferLineGoToBuffer 5<CR>', s)
nm('<spc>6', '<Cmd>BufferLineGoToBuffer 6<CR>', s)
nm('<spc>7', '<Cmd>BufferLineGoToBuffer 7<CR>', s)
nm('<spc>8', '<Cmd>BufferLineGoToBuffer 8<CR>', s)
nm('<spc>9', '<Cmd>BufferLineGoToBuffer 9<CR>', s)

map('n', '<leader><bs>', ':nohlsearch<CR>', default) --clear highlights

-- Open/close folds
map('n', '<leader>zo', ':foldopen<CR>', default) --clear highlights
map('n', '<leader>zc', ':foldclose<CR>', default) --clear highlights

map('n', '<leader>b1', ':b<space>1<CR>', default)
map('n', '<leader>b2', ':b<space>2<CR>', default)
map('n', '<leader>b3', ':b<space>3<CR>', default)
map('n', '<leader>b4', ':b<space>4<CR>', default)
map('n', '<leader>b5', ':b<space>5<CR>', default)
map('n', '<leader>b6', ':b<space>6<CR>', default)
map('n', '<leader>b7', ':b<space>7<CR>', default)
map('n', '<leader>b8', ':b<space>8<CR>', default)
map('n', '<leader>b9', ':b<space>9<CR>', default)
map('n', '<leader>b0', ':b<space>0<CR>', default)
map('n', '<leader>1', ':b<space>1<CR>', default)
map('n', '<leader>2', ':b<space>2<CR>', default)
map('n', '<leader>3', ':b<space>3<CR>', default)
map('n', '<leader>4', ':b<space>4<CR>', default)
map('n', '<leader>5', ':b<space>5<CR>', default)
map('n', '<leader>6', ':b<space>6<CR>', default)
map('n', '<leader>7', ':b<space>7<CR>', default)
map('n', '<leader>8', ':b<space>8<CR>', default)
map('n', '<leader>9', ':b<space>9<CR>', default)
map('n', '<leader>0', ':b<space>0<CR>', default)

map('n', '<leader>vs', ':e ~/.config/nvim/lua/settings.lua<CR>', {})
map('n', '<leader>vd', ':e ~/.config/nvim/lua/debug.lua<CR>', {})
map('n', '<leader>vl', ':so ~/.config/nvim/lua/lsp.lua<CR>', {})
map('n', '<leader>vk', ':e ~/.config/nvim/lua/keymaps.lua<CR>', {})
map('n', '<leader>va', ':e ~/.config/nvim/lua/autocmd.lua<CR>', {})
map('n', '<leader>vp', ':e ~/.config/nvim/lua/plugins.lua<CR>', {})
map('n', '<leader>vl', ':e ~/.config/nvim/lua/lsp.lua<CR>', {})
map('n', '<leader>v<space>', ':luafile ~/.config/nvim/init.lua<CR>', {})
map('n', '<leader>vv<space>', ':luafile %<CR>', {})
map('n', '<leader>vu', ':e ~/.config/nvim/lua/utils.lua<CR>', {})
map('n', '<leader>vf', ':e ~/.config/nvim/lua/plugins/fzf.lua<CR>', {})
map('n', '<leader>vt', ':e ~/.config/nvim/lua/plugins/telescope.lua<CR>', {})
map('n', '<leader>vT', ':e ~/.config/nvim/lua/plugins/nvim-tree.lua<CR>', {})
map('n', '<leader>vi', ':e ~/.config/nvim/init.lua<CR>', default)
map('n', '<leader>vc', ':e ~/.config/nvim/init.lua<CR>', default)

-- Insert mode motion
map('i', '<c-a-j>', '<down>', default)
map('i', '<c-a-h>', '<left>', default)
map('i', '<c-a-k>', '<up>', default)
map('i', '<c-a-l>', '<right>', default)
map('i', '<c-a-w>', '<esc>lwi', default)
map('i', '<c-a-e>', '<esc>lea', default)
map('i', '<c-a-b>', '<esc>bi', default)
map('i', '<c-a-x>', '<esc>xi', default)

-- Command mode motion
map('c', '<c-a-h>', '<left>', {})
map('c', '<c-a-h>', '<left>', {}) 
map('c', '<c-a-k>', '<up>', {})
map('c', '<c-a-l>', '<right>', {})

-- Split mappings
map('n', '<leader>-', '<C-w>s<C-w>j', default)
map('n', '<leader>_', '<C-w>v<C-w>l', default)
map('n', '<leader>=', '<C-w>v<C-w>l', default)
map('n', '<leader>s-', '<C-w>s<C-w>j', default)
map('n', '<leader>s_', '<C-w>v<C-w>l', default)
map('n', '<leader>s=', '<C-w>v<C-w>l', default)

-- Split terminal mappings
map('n', '<leader>t-', '<C-w>s:term<CR>i', { noremap = true })
map('n', '<leader>t_', '<C-w>v:term<CR>i', { noremap = true })
map('n', '<leader>t=', '<C-w>v:term<CR>i', { noremap = true })



map('c', '<c-j>', '<c-n>', default)
map('c', '<c-k>', '<c-p>', default)

map('n', '<c-v>r', '<ESC>:%s///gi<left><left><left><left>', { noremap = true })
map('n', '<c-v><c-r>', '<ESC>:%s///gi<left><left><left><left>', { noremap = true })
map('i', '<c-v>r', '<ESC>:%s///gi<left><left><left><left>', { noremap = true })
map('i', '<c-v><c-d>', '<C-R>=strftime("$(%m/%d/%y)$")<CR><space>', { noremap = true, silent = true })
map('i', '<c-v><c-t>', '<C-R>=strftime("$(%H:%M)$")<CR><space>', { noremap = true, silent = true })
map('n', '<c-v><c-d>', '<C-R>=strftime("$(%m/%d/%y)$")<CR><space>', { noremap = true, silent = true })
map('n', '<c-v><c-t>', '<C-R>=strftime("$(%H:%M)$")<CR><space>', { noremap = true, silent = true })
map('n', '<space>id', '<C-R>=strftime("$%m/%d/%y$")<CR><space>', { noremap = true, silent = true })
map('n', '<space>it', '<C-R>=strftime("$%H:%M$")<CR><space>', { noremap = true, silent = true })

-- PLUGIN MAPS figure out how to do this with packer

-- Surround.vim
map ('n', ',s', 'ysiw', default)
map ('n', ',S', 'ysiW', default)
-- Special services
map ('n', '<space>G', ':Neogit<CR>', default)
map ('n', '<space>T', ':Trouble<CR>', default)

-- <C-h> (undefined)
map ('n', '<c-h>', ':History<CR>', default)

-- FZF (<C-f> and <space>f)
map ('n', '<c-f><c-f>', ':Telescope find_files<CR>', default)
-- map ('n', '<c-f><c-w>', ':Files ~/wiki<CR>', default)
map ('n', '<c-f><c-h>', ':Telescope oldfiles<CR>', default)
map ('n', '<c-f><c-b>', ':Telescope buffers<CR>', default)
map ('n', '<c-f><c-c>', ':Telescope commands<CR>', default)
map ('n', '<c-f><c-g>', ':Telescope current_buffer_fuzzy_find<CR>', default)
map ('n', '<c-f><c-k>', ':Telescope keymaps<CR>', default)
map ('n', '<c-f><c-l>', ':Telescope live_grep<CR>', default)
map ('n', '<c-f><c-t>', ':Telescope tags<CR>', default)
-- map ('n', '<c-f><c-w>', ':Windows<CR>', default)
map ('n', '<c-f><c-m>', ':Telescope man_pages<CR>', default)
map ('n', '<c-f>gf',    ':Telescope git_files<CR>', default)
-- map ('n', '<c-f>gc',    ':Commits<CR>', default)
-- map ('n', '<c-f>h',     ':Helptags<CR>', default)
-- map ('n', '<c-f>c',     ':Colors<CR>', default)
map ('n', '<leader>ff', ':Files<CR>', default)
map ('n', '<leader>fd', ':LspDiagnostics 0<CR>', default)
map ('n', '<leader>fD', ':LspDiagnosticsAll<CR>', default)
map ('n', '<leader>fg', ':Rg<CR>', default)
map ('n', '<leader><space>g', ':Telescope grep_string<CR>', default)
map ('n', '<leader><Space>f', ':Telescope find_files<CR>', default)
-- map ('n', '<leader>fg', ':Telescope grep_string<CR>', default)
map ('n', '<leader>fh', ':History<CR>', default)
map ('n', '<leader>fc', ':Telescope commands<CR>', default)
-- map ('n', '<leader>fC', ':Colors<CR>', default)
map ('n', '<leader>fb', ':Telescope buffers<CR>', default)
map ('n', '<leader>fl', ':Telescope live_grep<CR>', default)
-- map ('n', '<leader>fH', ':Helptags<CR>', default)
map ('n', '<leader>fk', ':Maps<CR>', default)
map ('n', '<leader><space>k', ':Telescope keymaps<CR>', default)
-- map ('n', '<leader>fF', ':Filetypes<CR>', default)
map ('n', '<leader>ft', ':Telescope tags<CR>', default)
map ('n', '<leader>fm', ':Telescope man_pages<CR>', default)

-- Snippets (<space>s)
map ('n', '<leader>so', ':VsnipOpen<CR>1<CR>', default)
map ('n', '<leader>se', ':VsnipOpenEdit<CR>1<CR>', default)
map ('n', '<leader>s-', ':VsnipOpenSplit<CR>1<CR>', default)
map ('n', '<leader>s_', ':VsnipOpenVsplit<CR>1<CR>', default)
map ('n', '<leader><space>so', ':VsnipOpen<CR>2<CR>', default)
map ('n', '<leader><space>se', ':VsnipOpenEdit<CR>2<CR>', default)
map ('n', '<leader><space>s-', ':VsnipOpenSplit<CR>2<CR>', default)
map ('n', '<leader><space>s_', ':VsnipOpenVsplit<CR>2<CR>', default)
map ('v', '<leader>sy', ':VsnipYank<CR>', default)
--([ map ('i', '<c-tab>,'  , "luasnip#expand_or_jumpable() ? <Plug>luasnip-expand-or-jump : '<c-tab>'" , expr)
map ('i', '<c-s-tab>',  "<cmd>lua' require'luasnip'.jump(-1)<Cr>", expr)
map ('i', '<c-n>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-n>'", expr)
map ('s', '<c-n>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-n>'", expr)
map('s',  '<c-tab>', "<cmd>lua require('luasnip').jump(1)<C", silent)
map('s',  '<c-s-tab>', "<cmd>lua require('luasnip').jump(-1)<Cr>", silent)


-- Telescope (<space><Space>)
map ('n', '<leader><space>ff', ':Telescope find_files<CR>', default)
map ('n', '<leader><space>fb', ':Telescope file_browser<CR>', default)
map ('n', '<leader><space>fd', ':Telescope fd<CR>', default)
map ('n', '<leader><space>fh', ':Telescope oldfiles<CR>', default)
map ('n', '<leader><space>gl', ':Telescope live_grep<CR>', default)
map ('n', '<leader><space>gg', ':Telescope current_buffer_fuzzy_find<CR>', default)
map ('n', '<leader><space>gs', ':Telescope grep_string<CR>', default)
map ('n', '<leader><space>H', ':Telescope help_tags<CR>', default)
map ('n', '<leader><space>hs', ':Telescope search_history<CR>', default)
map ('n', '<leader><space>ht', ':Telescope help_tags<CR>', default)
map ('n', '<leader><space>hf', ':Telescope oldfiles<CR>', default)
map ('n', '<leader><space>hc', ':Telescope command_history<CR>', default)
map ('n', '<leader><space>k', ':Telescope keymaps<CR>', default)
map ('n', '<leader><space>b', ':Telescope buffers<CR>', default)
map ('n', '<leader><space>cc', ':Telescope commands<CR>', default)
map ('n', '<leader><space>ch', ':Telescope command_history<CR>', default)
map ('n', '<leader><space>cs', ':Telescope colorschemes<CR>', default)
map ('n', '<leader><space>m', ':Telescope man_pages<CR>', default)
map ('n', '<leader><space>t', ':Telescope tags<CR>', default)
map ('n', '<leader><space>T', ':Telescope treesitter<CR>', default)
map ('n', '<leader><space>s', ':Telescope symbols<CR>', default)
map ('n', '<leader><space>lq', ':Telescope quickfix<CR>', default)
map ('n', '<leader><space>lL', ':Telescope loclist<CR>', default)
map ('n', '<leader><space>S', ':Telescope lsp_document_symbols<CR>', default)
map ('n', '<leader><space>ld', ':Telescope lsp_document_diagnostics<CR>', default)
map ('n', '<leader><space>ls', ':Telescope lsp_document_symbols<CR>', default)
map ('n', '<leader><space>lS', ':Telescope lsp_workspace_symbols<CR>', default)
map ('n', '<leader><space>lD', ':Telescope lsp_workspace_diagnostics<CR>', default)
map ('n', '<leader><space>ls', ':Telescope lsp_implementations<CR>', default)
map ('n', '<leader><space>lwd', ':Telescope lsp_workspace_diagnostics<CR>', default)
map ('n', '<leader><space>lws', ':Telescope lsp_workspace_symbols<CR>', default)
map ('n', '<leader><space>lwS', ':Telescope lsp_workspace_dynamic_symbols<CR>', default)
map ('n', '<leader><space>la', ':Telescope lsp_code_actions<CR>', default)
map ('n', '<leader><space>lr', ':Telescope lsp_references<CR>', default)
map ('n', '<leader><space>lf', ':Telescope lsp_definitions<CR>', default)
map ('n', '<leader><space>lla', ':Telescope lsp_code_actions<CR>', default)
map ('n', '<leader><space>llr', ':Telescope lsp_references<CR>', default)
map ('n', '<leader><space>llf', ':Telescope lsp_definitions<CR>', default)

-- Lspsaga
-- lsp provider to find the cursor word definition and reference
-- map('n',  ',,r', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", noremap)
-- <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
map('n', ',,f',       ":Lspsaga lsp_finder<CR>", noremap) -- or use command LspSagaFinder
map('n', ',,a', ":Lspsaga code_action<CR>", default)
map('n', ',,ca', ":Lspsaga code_action<CR>", default)
map('n', ',,R', ":Lspsaga rename<CR>", default)
map('n', ',,t', ":Lspsaga open_floaterm<CR>", default)
map('n', '<c-o><c-t>', ":Lspsaga open_floaterm<CR>", default)
map('n', '<F10>', ":Lspsaga open_floaterm<CR>", default)
map('n', '<a-d>', ":Lspsaga open_floaterm<CR>", default)
map('n', ',,q', ":Lspsaga close_floaterm<CR>", default)
map('t', '<c-o><c-t>', "<c-\\><c-n>:Lspsaga close_floaterm<CR>", default)
map('t', '<F10>', "<c-\\><c-n>:Lspsaga close_floaterm<CR>", default)
map('t', '<c-d>', "<c-\\><c-n>:Lspsaga close_floaterm<CR>", default)
map('t', '<a-d>', "<c-\\><c-n>:Lspsaga close_floaterm<CR>", default)
map('v', ',,a', ":<C-U>Lspsaga range_code_action<CR>", default)
map('n', ',,h', ":Lspsaga hover_doc<CR>", default)
map('n', ',df', ":Lspsaga preview_definition<CR>", default)
map('n', ',dc', ":Lspsaga show_cursor_diagnostics<CR>", default)
map('n', ',dd', ":Lspsaga show_line_diagnostics<CR>", default)
map('n', ',dl', ":Lspsaga show_line_diagnostics<CR>", default)
map('n', ',cd', ":Lspsaga show_line_diagnostics<CR>", default)
map('n', ',dS', ":Lspsaga show_line_diagnostics<CR>", default)
map('n', ',d,', ":Lspsaga diagnostic_jump_prev<CR>", default)
map('n', ',d.', ":Lspsaga diagnostic_jump_next<CR>", default)
map('n', ',,H', ":Lspsaga signature_help<CR>", default)
map('n', ',,i', ":Lspsaga implement<CR>", default)
map('n', ',h', ":Lspsaga hover_doc<CR>", default)
map('n', ',s', ":Lspsaga signature_help<CR>", default)
map('n', ',R', ":Lspsaga rename<CR>", default)
map('n', ',H', ":Lspsaga signature_help<CR>", default)
map('v', ',a', ":<C-U>Lspsaga range_code_action<CR>", default)
map('n', ',ca', ":Lspsaga code_action<CR>", default)
map('n', ',a', ":Lspsaga code_action<CR>", default)
map('n', ',i', ":Lspsaga implement<CR>", default)
map ('n', ',tf', ':TroubleToggle lsp_definitions<CR>', default)
map ('n', ',td', ':TroubleToggle lsp_document_diagnostics<CR>', default)
map ('n', ',tD', ':TroubleToggle lsp_workspace_diagnostics<CR>', default)
map ('n', ',ti', ':TroubleToggle lsp_implementations<CR>', default)
map ('n', ',tr', ':TroubleToggle lsp_references<CR>', default)
map ('n', ',tl', ':TroubleToggle loclist<CR>', default)
map ('n', ',tq', ':TroubleToggle quickfix<CR>', default)
map ('n', ',tt', ':ToggleTerm<CR>', default)
map ('n', ',tf', ':Lspsaga open_floaterm<CR>', default)
map ('t', ',tt', '<C-\\><C-n>:ToggleTerm<CR>', default)
map ('t', ',tf', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', default)
map ('n', ',tT', ':TroubleToggle telescope<CR>', default)
map ('n', ',tc', ':TroubleClose<CR>', default)
map ('n', ',t<space>', ':TroubleToggle<CR>', default)
map ('n', ',dd', ':TroubleToggle<CR>', default)
map ('n', ',tr', ':TroubleRefresh<CR>', default)
map('n', ',<space>', ":Lspsaga hover_doc<CR>", default)
map('n',  '<c-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", default)
map('n',  '<c-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", default)
-- scroll up hover doc

-- NVIM bufferline 

-- NVIM Tree.lua
--([ map ('n', '<leader>n', ':NvimTreeToggle<CR>', default)
map ('n', '<leader>oe', ':NvimTreeToggle<CR>', default)
map ('n', '<leader>ov', ':VsnipOpenEdit<CR>', default)
map ('n', '<leader>os', ':SymbolsOutline<CR>', default)
map ('n', '<leader>ot', ':ToggleTerm<CR>', default)
map ('n', '<leader>of', ':Lspsaga open_floaterm<CR>', default)
map ('n', '<leader>oh', ':Lspsaga hover_doc<CR>', default)
map ('n', '<leader>of', ':TroubleToggle lsp_definitions<CR>', default)
map ('n', '<leader>or', ':TroubleToggle lsp_references<CR>', default)
map ('n', '<leader>od', ':TroubleToggle lsp_implementations<CR>', default)
map ('n', '<leader>od', ':TroubleToggle lsp_document_diagnostics<CR>', default)
map ('n', '<leader>oD', ':TroubleToggle lsp_workspace_diagnostics<CR>', default)
map ('n', '<leader>ol', ':TroubleToggle lsp_loclist<CR>', default)
map ('n', '<leader>oL', ':Lspsaga lsp_finder<CR>', default)
map ('n', '<leader>oq', ':TroubleToggle quickfix<CR>', default)
map ('n', '<leader>om', ':messages<CR>', default)




-- odnt work
--([ map ('n', '<c-;>', ':ToggleTerm<CR>', default)
map ('v', '<c-;>', ':ToggleTerm<CR>', default)
map ('n', '<>', ':ToggleTerm<CR>', default)
map ('t', '<c-;>', ':ToggleTerm<CR>', default)

map ('t', 'kj', '<C-\\><C-n>', { silent = true})

-- Rust actions
-- map('n', '<leader>lh', require'rust-tools.hover_actions'.hover_actions(), default)


-- compe
map('n',  '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default)
map('n',  '<space>gD', '<cmMd>lua vim.lsp.buf.declaration()<CR>', default)
--[[

map('n',  '<space>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', default)
map('n',  '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default)
map('n',  '<space>cd', ':LspDiagnostics 0<CR>', default)
map('n',  '<space>cD', ':LspDiagnosticsAll<CR>', default)
map('n',  '<space>cr', '<cmd>lua vim.lsp.buf.references()<CR>', default)
map('n',  '<space>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', default)
map('n',  '<space>cy', '<cmd>lua vim.lsp.buf.buf_type_definition()<CR>', default)
map('x',  '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', default)
map('n',  '<space>ck', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default)
map('x',  '<space>cs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', default)
map('n',  '<space>cS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', default)
map('n',  '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', default)
map('x',  '<space>cf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', default) ]]
map('n',  '<Tab>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default)
map('n',  '<S-Tab>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default)

-- map('n',  ',rr', ':Crun<CR>', default)
-- map('n',  ',rb', ':Cbuild<CR>', default)
--([ map('n',  ',ra', ':RustHoverActions<CR>', default)
map('n',  ',rc', ':RustOpenCargo<CR>', default)
map('n',  ',rp', ':RustParentModule<CR>', default)
map('n',  ',rmk', ':RustMoveItemUp<CR>', default)
map('n',  ',rmj', ':RustMoveItemDown<CR>', default)
map('n',  ',rj', ':RustJoinLines<CR>', default)

map('n', ',rr', ':TermExec cmd="cargo run"<CR>', { noremap = true})
map('n', ',rb', ':TermExec cmd="cargo build"<CR>', { noremap = true})

map('n', ',zr', ':TermExec cmd="zig build run"<CR>', { noremap = true})
map('n', ',zb', ':TermExec cmd="zig build"<CR>', { noremap = true})
map('n', ',zt', ':TermExec cmd="zig test"<CR>', { noremap = true})
--([ map('n', ',zb', ':compiler zig_build_exe<CR>', { noremap = true})
map('n', ',zt', ':compiler zig_test<CR>', { noremap = true})
map('n', ',zt', ':compiler zig_test<CR>', { noremap = true})


map('n',  ',fr', ':FlutterRun<CR>', default)
-- COMPE
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn('compe#complete')()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end


vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {silent=true,expr = true})
vim.api.nvim_set_keymap("i", "<c-j>", "v:lua.tab_complete()", {silent=true,expr = true})
vim.api.nvim_set_keymap("s", "<c-j>", "v:lua.tab_complete()", {silent=true,expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {silent=true,expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {silent=true,expr = true})
vim.api.nvim_set_keymap("s", "<c-k>", "v:lua.s_tab_complete()", {silent=true,expr = true})

vim.api.nvim_set_keymap("n", "<space>od", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>od", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)





-- leader normal mode command
local lnmc = function(key, target)
   return nm("<space>" .. key, "<ESC>:" .. target .."<CR>", ns) 
end

local stele = function(key, target)
    return nm("<space>" .. key, "<ESC>:Telescope " .. target .. "<CR>", ns)
end
local dtele = function(key, target)
    return nm("<space><space>" .. key, "<ESC>:Telescope " .. target .. "<CR>", ns)
end
vim.cmd [[tnoremap <silent> <C-[><C-[> <C-\><C-n> ]]

map("t", "<C-[><C-[>", "<C-\\><C-n>", ns)
map("t", "qq", "<C-\\><C-n>", ns)
map("t", "kj", "<C-\\><C-n>", ns)
map("t", "jk", "<C-\\><C-n>", ns)
map("t", ",t", "<C-\\><C-n>:ToggleTerm<CR>", ns)

stele("ff", "find_files")
stele("fh", "oldfiles")
stele("fb", "buffers")
stele("fg", "live_grep")
stele("fG", "grep_string")
stele("fp", "pickers")
stele("ft", "tags")
stele("fk", "keymaps")
stele("fn", "notify")

stele(";", "command_history")
stele(":", "commands")
stele("/", "search_history")
stele(".", "buffers")

stele("ld", "lsp_definitions")
stele("li", "lsp_implementations")
stele("ltd", "lsp_type_definitions")
stele("ltr", "lsp_type_references")
stele("lr", "lsp_type_definitions")
stele("dd", "lsp_document_diagnostics")
stele("dw", "lsp_workspace_diagnostics")
stele("sd", "lsp_document_symbols")
stele("sw", "lsp_workspace_symbols")
stele("ss", "lsp_dynamic_workplace_symbols")
stele("ca", "lsp_code_actions")
stele("cr", "lsp_range_code_actions")

dtele("C", "colorschemes")
dtele("c", "commands")
dtele("b", "builtins")
dtele("h", "help_tags")
dtele("m", "man_pages")
dtele("f", "file_browser")
dtele("-", "fd")
dtele("gf", "git_files")

dtele("<space>", "live_grep")

nm("g<space>", "<ESC>:Telescope live_grep<CR>", ns)
nm("g,", "<ESC>:Telescope grep_string<CR>", ns)

dtele("G", "live_grep")

map("n", "<space>q", "<ESC>:q!<CR>", ns)
map("n", "<space>w", "<ESC>:w!<CR>", ns)

nm("<space><bs>", "<ESC>:noh<CR>", ns)
vm("<space><bs>", "<ESC>:noh<CR>", ns)

nm("<space>bd", "<ESC>:bwipeout<CR>", ns)
vm("<space>bd", "<ESC>:bwipeout<CR>", ns)

nm("<space>ss", "<ESC>:SearchBoxIncSearch<CR>", n)
vm("<space>ss", "<esc>:searchboxincSearch visual_mode=true<cr>", n)
nm("<space>sr", "<ESC>:SearchBoxReplace<CR>", n)
vm("<space>sr", "<esc>:searchboxReplace visual_mode=true<cr>", n)

-- Convenience telescopes

lnmc("n", "NvimTreeToggle")
lnmc("Nr", "NvimTreeRefresh")
lnmc("Nf", "NvimTreeFind")

nm("<space>ot", ":ToggleTerm<CR>", ns)
nm(",t", ":ToggleTerm<CR>",ns)

lnmc("tt", "TroubleToggle")
lnmc("tq", "TroubleToggle quickfix")
lnmc("tl", "TroubleToggle loclist")
lnmc("t<space>", "TroubleToggle telescope")
lnmc("tr", "TroubleRefresh")
lnmc("tt", "TroubleToggle")
lnmc("tr", "TroubleToggle lsp_references")
lnmc("ti", "TroubleToggle lsp_implementations")
lnmc("tf", "TroubleToggle lsp_definitions")
lnmc("tf", "TroubleToggle lsp_type_references")
lnmc("td", "TroubleToggle document_diagnostics")
lnmc("tw", "TroubleToggle workspace_diagnostics")

lnmc("a<space>", "AerialToggle!")
lnmc("at", "AerialTreeToggle!")
lnmc("ao", "AerialTreeOpenAll")
lnmc("ac", "AerialTreeCloseAll")
lnmc("aa", "AerialToggle!")
lnmc("an", "AerialNext")
lnmc("ap", "AerialPrev")

-- TERM SENDING STUFF t
lnmc("tl", "TermExec cmd=lsd")

lnmc(",,r", "TermExec cmd=cargo run")
lnmc(",,n", "TermExec cmd=nimble run")
lnmc(",,z", "TermExec cmd=zig build run")

nm("<space>vi", ":e ~/.config/nvim/init.lua<CR>", ns)
nm("<space>vk", ":e ~/.config/nvim/lua/keymaps.lua<CR>", ns)
nm("<space>vc", ":e ~/.config/nvim/lua/plugins/cmp.lua<CR>", ns)
nm("<space>vt", ":e ~/.config/nvim/lua/plugins/telescope.lua<CR>", ns)
nm("<space>vp", ":e ~/.config/nvim/lua/plugins.lua<CR>", ns)
nm("<space>vl", ":e ~/.config/nvim/lua/lsp.lua<CR>", ns)
nm("<space>vL", ":e ~/.config/nvim/lua/plugins/lspconfig.lua<CR>", ns)
nm("<space>vs", ":e ~/.config/nvim/lua/settings.lua<CR>", ns)

nm("<leader>f", "<ESC>:Format<CR>", s)


vim.api.nvim_set_keymap("n", "<leader>wa", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wo", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>wmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>wmn", ":+tabmove<CR>", { noremap = true })
--- CODE STUFF <c-space>
-- local yabs = require('yabs')

--[[ nm("<space>cb", yabs.run_task('build'), n)
nm("<space>cr", yabs.run_task('build_and_run'), n)
nm("<space>c<space>", yabs.run_command('echo hello, world', 'quickfix', { open_on_run = 'always' }), n) ]]


