local M = {}
local custom_theme = require('lualine.themes.nightfly')

function M.setup()
  require('lualine').setup {
    options = {
      theme = "tokyonight",
      icons_enabled = true,
    },
  }
end

return M
