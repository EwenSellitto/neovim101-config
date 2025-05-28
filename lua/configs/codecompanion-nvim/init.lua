local M = {
  strategies = {
    chat = {
      slash_commands = {
        ["file"] = {
          opts = {
            provider = "telescope",
          },
        },
      },
    },
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
      provider = "telescope",
    },
    diff = {
      provider = "mini_diff", -- default|mini_diff
    },
    chat = {
      separator = "─",
    },
  },
}

return M
