local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

local function get_processes()
  local handle = io.popen "ps -e -o pid,comm,cmd"

  if not handle then
    vim.notify("Failed to get process list", vim.log.levels.ERROR)
    return {}
  end

  local result = handle:read "*a"
  handle:close()

  local processes = {}
  for line in result:gmatch "[^\r\n]+" do
    local pid, name = line:match "^%s*(%d+)%s+(.+)"
    if pid and name then
      table.insert(processes, {
        pid = tonumber(pid),
        name = name,
        display = string.format("%s: %s", pid, name),
      })
    end
  end

  return processes
end

M.pick_process = function(opts)
  opts = opts or {}

  pickers
    .new(opts, {
      prompt_title = "Select Process (PID)",
      finder = finders.new_table {
        results = get_processes(),
        entry_maker = function(entry)
          return {
            value = entry.pid,
            display = entry.display,
            ordinal = entry.display,
          }
        end,
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          local pid = selection.value

          if opts.callback then
            opts.callback(pid)
          end
        end)
        return true
      end,
    })
    :find()
end

return M
