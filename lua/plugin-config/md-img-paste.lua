local G = require('G')
local M = {}

function M.setup()
  G.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    callback = function ()
      vim.keymap.set(
        'n', '<leader>p', '<cmd>call mdip#MarkdownClipboardImage()<CR>', { buffer = true, silent = true, remap = true }
      )
    end
  })
end

return M
