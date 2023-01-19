local G = require('G')
local M = {}

-- toggleFT func: 存在对应名称的窗口则toggle，否则新建
function M.toggleFT(name, cmd)
    if G.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        G.cmd(string.format('exec "FloatermToggle %s"', name))
    else
        G.cmd(string.format('FloatermNew --name=%s %s', name, cmd))
    end
end

function M.setFTToggleMap(key, name, cmd)
    G.map({
        { 'n', key, string.format(":lua require('plugin-config/vim-floaterm').toggleFT('%s', '%s')<cr>", name, cmd), { silent = true, noremap = true }},
        { 't', key, "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('" .. name .. "') == bufnr('%') ? '' : '" .. key.. "') : '" .. key.. "'", {silent = true, expr = true}},
    })
end

-- 特殊func 定义了F5行为时根据当前文件类型调用不同的命令
function M.runFile()
    G.cmd('w')
    local ft = G.eval('&ft')
    local run_cmd = { javascript = 'node', typescript = 'ts-node', html = 'microsoft-edge-stable', python = 'python', go = 'go run', sh = 'bash', lua = 'lua' }
    if run_cmd[ft] then M.toggleFT('RUN', run_cmd[ft] .. ' %')
    -- elseif ft == 'markdown' then G.cmd('MarkdownPreview')
    elseif ft == 'java' then M.toggleFT('RUN', 'javac % && java %<')
    elseif ft == 'c' then M.toggleFT('RUN', 'gcc % -o %< && ./%< && rm %<')
    end
end

function M.config()
  G.g.floaterm_title = ''
  G.g.floaterm_width = 0.8
  G.g.floaterm_height = 0.8
  G.g.floaterm_autoclose = 0
  G.g.floaterm_opener = 'edit'
  G.cmd("au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif")
  G.cmd("hi FloatermBorder ctermbg=none")

  M.setFTToggleMap('<c-t>', 'TERM', '')
  M.setFTToggleMap('<c-f>', 'RANGER', 'ranger')
  M.setFTToggleMap('<c-g>', 'LAZYGIT', 'lazygit')
  -- M.setFTToggleMap('<c-b>', 'DBUI', 'nvim +CALLDB')  // 基于nvim的DB管理工具
  G.map({
        { 'n', '<F5>', ':lua require("plugin-config/vim-floaterm").runFile()<cr>', {silent = true, noremap = true}},
        { 'i', '<F5>', '<esc>:lua require("plugin-config/vim-floaterm").runFile()<cr>', {silent = true, noremap = true}},
        { 't', '<F5>', "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('RUN') == bufnr('%') ? '' : '<F5>') : '<F5>'", {silent = true, expr = true}}
  })
end

return M
