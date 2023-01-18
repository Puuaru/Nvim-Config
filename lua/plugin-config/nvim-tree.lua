local G = require("G")
local M = {}

function M.setup()
  local nvim_tree = require("nvim-tree")
  nvim_tree.setup ({
    sort_by = "case_sensitive",
    -- 关闭文件时自动关闭，现已被取消
    -- auto_close = true,
    -- 不显示 git 状态图标
    git = {
      enable = true
    },
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local columns = G.o.columns
          local lines = G.o.lines
          local width = math.max(math.floor(columns * 0.5), 50)
          local height = math.max(math.floor(lines * 0.5), 20)
          local left = math.ceil((columns - width) * 0.5)
          local top = math.ceil((lines - height) * 0.5 - 2)
          return { relative = "editor", border = "rounded", width = width, height = height, row = top, col = left }
      end,
      }
    }
  })
end

return M
