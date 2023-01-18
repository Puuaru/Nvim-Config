vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    -- 使用 nvim 自带的lsp
    diagnostics = "nvim_lsp",
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }}
  }
}
