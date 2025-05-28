local options = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "󰑕",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
}

return options
