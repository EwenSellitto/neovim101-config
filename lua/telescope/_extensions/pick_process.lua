local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  vim.notify("Telescope is not installed", vim.log.levels.ERROR)
end

return telescope.register_extension {
  exports = {
    pick_process = function(opts)
      local pick_process = require "configs.telescope.pick-process"
      pick_process.pick_process(opts)
    end,
  },
}
