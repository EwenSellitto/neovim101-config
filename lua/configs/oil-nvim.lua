local M = {
  float = {
    padding = 3,
    max_width = 0.8,
    max_height = 0.7,
    preview_split = "right",
  },
  keymaps = {
    ["<Esc><Esc>"] = { "actions.close", mode = "n" },
  },
  view_options = {
    show_hidden = true,
  },
}

return M
