local M = {}
local custom_theme = require('lualine.themes.nightfly')

function M.setup()
  require('lualine').setup {
    options = {
      theme = custom_theme,
      icons_enabled = true,
    },
  }
end

return M
