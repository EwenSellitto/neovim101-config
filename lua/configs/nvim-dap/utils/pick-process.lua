local M = {}

M.pick_process = function()
  local telescope_loaded, telescope = pcall(require, "telescope")
  if telescope_loaded then
    local has_extension = pcall(function()
      return telescope.extensions.pick_process
    end)

    if has_extension then
      local co = coroutine.running()
      if co then
        telescope.extensions.pick_process.pick_process {
          callback = function(pid)
            coroutine.resume(co, pid)
          end,
        }
        local pid = coroutine.yield()
        vim.notify("Selected PID: " .. pid, vim.log.levels.INFO)
        return pid or require("dap").ABORT
      else
        return require("dap.utils").pick_process()
      end
    end
  end

  return require("dap.utils").pick_process()
end

return M
