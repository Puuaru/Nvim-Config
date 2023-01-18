local G = require('G')
local M = {}

require("tokyonight").setup({
  style = "moon",
  transparent = false,
  terminal_colors = false
})

G.cmd('colorscheme tokyonight-storm')

return M
