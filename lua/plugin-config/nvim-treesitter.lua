require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"html", "css", "vim", "lua", "javascript", "vue", "java"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  }
  -- 暂不使用 Folding 模块
  -- vim.opt.foldmethod = "expr"
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
}
