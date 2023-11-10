---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  hl_override = {
    VM_Insert = { bg = "green" },
  },
  transparency = false,
  statusline = {
    theme = "vscode_colored",
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
