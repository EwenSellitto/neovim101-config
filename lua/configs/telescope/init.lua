local M = {}

M.config = function()
  local telescope = require "telescope"
  telescope.setup {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },

    extensions_list = { "themes", "terms" },
    extensions = {},
  }

  telescope.load_extension "pick_process"
end

return M
