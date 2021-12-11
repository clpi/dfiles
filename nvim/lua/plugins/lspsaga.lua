local function map(mode, key, res, opts)
    return vim.api.nvim_set_keymap(mode, key, res, opts)
end
local saga = require 'lspsaga'.setup{
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
      open = 'o', 
      vsplit = 's',
      split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
      quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
      quit = {'<C-c>', '<ESC>'},exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    border_style = "single",
    rename_prompt_prefix = '➤',
    -- like server_filetype_map = {metals = {'sbt', 'scala'}}
}

map("n", "gh", ":LspSaga lsp_finder<CR>", { silent = true, noremap = true})
map("n", "gr", ":LspSaga rename<CR>", { silent = true, noremap = true})
map("n", "gf", ":LspSaga preview_definition<CR>", { silent = true, noremap = true})
map("n", "<space>ch", ":<C-u>LspSaga lsp_finder<CR>", { silent = true, noremap = true})

map("n", "<space>ca", ":<C-u>Lspsaga code_action<CR>", { silent = true, noremap = true})
map("v", "<space>ca", ":<C-u>Lspsaga range_code_action<CR>", { silent = true, noremap = true})

map("n", "<space>c.", ":<c-u>Lspsaga hover_doc<CR>:",  { silent = true, noremap = true })
map("n", "<space>ck", ":<c-u>Lspsaga hover_doc<CR>:",  { silent = true, noremap = true })

map("n", "<space>cs", ":<c-u>Lspsaga signature_help<CR>:",  { silent = true, noremap = true })
map("v", "<space>cs", ":<c-u>Lspsaga signature_help<CR>:",  { silent = true, noremap = true })

vim.cmd [[nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]]
-- scroll up hover doc
vim.cmd[[nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]]

vim.cmd [[nnoremap <silent> <leader>dl :Lspsaga show_line_diagnostics<CR>]]
-- or use command
vim.cmd [[nnoremap <silent> <TAB> :Lspsaga diagnostic_jump_next<CR>]]
vim.cmd [[nnoremap <silent> <S-TAB> :Lspsaga diagnostic_jump_prev<CR>]]
vim.cmd [[vnoremap <silent> <TAB> :Lspsaga diagnostic_jump_next<CR>]]
vim.cmd [[vnoremap <silent> <S-TAB> :Lspsaga diagnostic_jump_prev<CR>]]


saga.init_lsp_saga {
  your custom option here
}

-- or --use default config
saga.init_lsp_saga()
