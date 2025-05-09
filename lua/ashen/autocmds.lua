local M = {}
local main = require("ashen")

local function augroup(name)
  return vim.api.nvim_create_augroup("ashen_" .. name, { clear = true })
end

M.lazy_cleared = false

M.load = function()
  local cmds = {
    highlight_yank = function()
      local opt = { higroup = "AshenYank", timeout = 100 }
      vim.api.nvim_create_autocmd("TextYankPost", {
        group = augroup("highlight_yank"),
        callback = function()
          (vim.hl or vim.highlight).on_yank(opt)
        end,
      })
    end,
  }
  for _, cmd in pairs(cmds) do
    cmd()
  end
end

return M
