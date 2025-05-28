local M = {}

M.setup = function(language_configs)
  local dap = require "dap"
  local mason_registry = require "mason-registry"

  for _, config in ipairs(language_configs) do
    local adapter_name = config.adapter_name
    local adapter_config = config.adapter_config
    local filetypes = config.filetypes
    local configurations = config.configurations
    local adapter_path = vim.fn.expand(config.adapter_path)

    -- Ensure the adapter is installed
    if not mason_registry.is_installed(config.mason_package) then
      vim.notify(config.mason_package .. " is not installed", vim.log.levels.ERROR)
      return
    end

    -- Add the adapter if it doesn't already exist
    if not dap.adapters[adapter_name] then
      dap.adapters[adapter_name] = adapter_config(adapter_path)
    end

    -- Add filetypes and configurations
    for _, language in ipairs(filetypes) do
      if not dap.configurations[language] then
        dap.configurations[language] = configurations
      end
    end
  end
end

return M
