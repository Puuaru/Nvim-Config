local G = require('G')
local M = {}

function M.config()
    G.g.coc_global_extensions = {
        'coc-marketplace',
        '@yaegassy/coc-volar',
        'coc-tsserver',
        'coc-json',
        'coc-html', 'coc-css', 'coc-vetur',
        'coc-sumneko-lua',
        'coc-vimlsp',
        'coc-sh', 'coc-db',
        'coc-java', 'coc-pyright',
        'coc-prettier',
        'coc-snippets', 'coc-pairs', 'coc-word',
        'coc-translator',
        'coc-markdownlint',
        'coc-git'
    }
    G.cmd("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
    G.cmd("command! -nargs=0 Prettier :CocCommand prettier.formatFile")
    G.cmd("hi! link CocPum Pmenu")
    G.cmd("hi! link CocMenuSel PmenuSel")
    G.map({
        { 'n', '<F2>', '<Plug>(coc-rename)', {silent = true} },
        { 'n', '<C-A-l>', ':Prettier<CR>', {silent = true} },
        { 'n', 'gd', '<Plug>(coc-definition)', {silent = true} },
        { 'n', 'gy', '<Plug>(coc-type-definition)', {silent = true} },
        { 'n', 'gi', '<Plug>(coc-implementation)', {silent = true} },
        { 'n', 'gr', '<Plug>(coc-references)', {silent = true} },
        { 'x', 'if', '<Plug>(coc-funcobj-i)', {silent = true} },
        { 'o', 'if', '<Plug>(coc-funcobj-i)', {silent = true} },
        { 'x', 'af', '<Plug>(coc-funcobj-a)', {silent = true} },
        { 'o', 'af', '<Plug>(coc-funcobj-a)', {silent = true} },
        { 'x', 'ic', '<Plug>(coc-classobj-i)', {silent = true} },
        { 'o', 'ic', '<Plug>(coc-classobj-i)', {silent = true} },
        { 'x', 'ac', '<Plug>(coc-classobj-a)', {silent = true} },
        { 'o', 'ac', '<Plug>(coc-classobj-a)', {silent = true} },
        { 'n', 'K', ':call CocAction("doHover")<cr>', {silent = true} },
        { 'i', '<c-f>', "coc#pum#visible() ? '<c-y>' : '<c-f>'", {silent = true, expr = true} },
        { 'i', '<C-j>', "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", {silent = true, noremap = true, expr = true} },
        { 'i', '<C-k>', "coc#pum#visible() ? coc#pum#prev(1) : \"\\<s-tab>\"", {silent = true, noremap = true, expr = true} },
        -- { 'i', '<TAB>', "coc#pum#visible() ? coc#pum#confirm() : \"\\<c-g>u\\<cr>\\<c-r>=coc#on_enter()\\<cr>\"", {silent = true, noremap = true, expr = true} },
        { 'i', '<TAB>', "coc#pum#visible() ? coc#pum#confirm() : \"<TAB>\"", {silent = true, noremap = true, expr = true} },
        { 'i', '<c-y>', "coc#pum#visible() ? coc#pum#confirm() : '<c-y>'", {silent = true, noremap = true, expr = true} },
        { 'n', '<F3>', ":silent CocRestart<cr>", {silent = true, noremap = true} },
        { 'n', '<F4>', "get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'", {silent = true, noremap = true, expr = true} },
        { 'n', '<F9>', ":CocCommand snippets.editSnippets<cr>", {silent = true, noremap = true} },
        { 'n', '<c-e>', ":CocList --auto-preview diagnostics<cr>", {silent = true} },
        { 'n', 'mm', "<Plug>(coc-translator-p)", {silent = true} },
        { 'v', 'mm', "<Plug>(coc-translator-pv)", {silent = true} },
        { 'x', '=', 'CocHasProvider("formatRange") ? "<Plug>(coc-format-selected)" : "="', {silent = true, noremap = true, expr = true}},
        { 'n', '=', 'CocHasProvider("formatRange") ? "<Plug>(coc-format-selected)" : "="', {silent = true, noremap = true, expr = true}},
    })
end

function M.setup()
    -- do nothing
end

return M
