local b = vim.bo
local o = vim.opt
local w = vim.wo
local opts = setmetatable({}, {__index={global_local={},er_window_local = {} }})

vim.opt.termguicolors = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.compatible = false
o.cmdheight = 1
o.matchtime = 2
o.updatetime = 100
o.backup = false
o.writebackup = false
o.encoding = "utf-8"
o.undofile = true
o.swapfile = false
o.syntax = "enable"
o.hlsearch = true
o.incsearch = true
o.inccommand = "nosplit"
o.ignorecase = true

o.wildmenu = true
o.wildoptions = "pum"
o.wildmode = "full"
o.autoread = true
o.lazyredraw = true
o.autochdir = true
o.scrolloff = 5
o.backspace = [[indent,eol,start]]
-- o.viewoptions = [[cursor,slash,unix]]
o.hidden = true
o.lazyredraw = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.clipboard = [[unnamed,unnamedplus]]
o.timeout = false;
o.inccommand = "split"
o.ruler = false
o.magic = true
-- o.foldcolumn = 0
-- o.foldmethod = "indent"
o.timeoutlen = 300
o.mouse = 'a'
o.history = 500
o.showcmd = true;
o.showmode = false;
-- Says to use menuone,noselect for compe, optionally souce
o.completeopt = [[menu,menuone,noselect]]

o.switchbuf = [[useopen,usetab,newtab]]
o.smarttab = true
o.showfulltag = true
o.ttyfast = true
o.pumblend = 22
o.winblend = 20
o.breakindent = true
o.shiftwidth=4
o.smartindent=true
o.expandtab=false
o.softtabstop=0


-- if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  -- o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
-- else
  -- o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
-- end

-- window-local options
w.wrap = true
w.number = true
w.relativenumber = true
w.winfixwidth = true
w.cursorline = true
-- w.listchars      = [[tab:\¦\ ,trail:▫]];
w.signcolumn = "yes"
-- w.list = true
-- w.colorcolumn = [[100]]

-- buffer-local options
b.expandtab = true
b.autoindent = true
b.softtabstop = 0
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = true
b.synmaxcol = 4000
    

-- Command 
local cmd = vim.cmd
local api = vim.api

-- api.nvim_command('filetype on')
-- api.nvim_command('filetype indent on')
--[[ api.nvim_command('filetype plugin indent on')
api.nvim_command('syntax enable') ]]
api.nvim_command('set shortmess+=c')

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax on ]]
vim.cmd [[ set rtp+=/home/xxx/src/config/vim ]]
-- api.nvim_command('colorscheme tokyonight')



  -- vim.g.vimwiki_list = {{
	  -- name= 'wiki', path = '~/wiki', syntax = 'markdown', ext = '.md',
	  -- automatic_nested_syntaxes= 1, path_html= '~/wiki/html',
	  -- diary_caption_level= 1, template_ext = ".html",
	  -- bullet_types = [[-,•→]], teplate_path='~/wiki/dev/tpl/html',
	  -- template_default = "index", auto_diary_index=1,
	  -- diary_header= "Entries", auto_generate_links=1, auto_generate_tags=1,
	  -- css_name="style.css",diary_frequency="daily",
	  -- diary_rel_path="diary/diary/",diary_index="index",
	  -- diary_start_week_day="monday",cycle_bullets=1,auto_tags=1,
	  -- template_date_format="%Y-%m-%d",
	  -- rx_todo='C<%(TODO|DONE|STARTED|FIXME|FIXED|XXX|NOTE|IMPORTANT)>'
  -- }}


-- vim.cmd[[colorscheme ayu]
