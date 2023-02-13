local G = require('G')
local M = {}

require("lualine").setup({
  theme = 'nord'
})

G.cmd('colorscheme nord')

return M
