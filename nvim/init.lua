-- Fully by me from scratch now
require("plugins")
require("settings")
require("keymaps")
require("autocmd")
require("lsp")
---
require("nvim-autopairs").setup {}
require('neoscroll').setup({
    mappings = {'<C-u>', '<C-d>', '<C-j>', '<C-k>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,    
})

require('ayu').setup({
    mirage = true, 
    overrides = {}, 
})


require("bufferline").setup{}
require("surround").setup{}
-- require("yabs").setup{}
-- require("feline").setup{}
require('go').setup()
require('gitsigns').setup()


---
require("plugins.lspconfig")
require("plugins.lsp_signature")
require("plugins.lsputils")
require('plugins.windline')
-- require("plugins.yabs")
require("plugins.trouble")
require("plugins.notify")
require("plugins.bufferline")
require("plugins.telescope")
require("plugins.null-hs")
require("plugins.symbols-help")
require("plugins.dressing")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.neorg")
require("plugins.nvim-lightbulb")
require("plugins.which-key")
require("plugins.aerial")

---
--
vim.cmd [[color ayu]]


