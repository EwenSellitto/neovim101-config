local config = function()
  local dap, dapui = require "dap", require "dapui"

  -- ============--
  --  UI stuff  --
  --============--

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  -- ==================================--
  --  Adding language configurations  --
  --==================================--

  require("configs.nvim-dap.dap-languages").setup {
    require "configs.nvim-dap.languages.typescript",
    require "configs.nvim-dap.languages.python",
    require "configs.nvim-dap.languages.bash",
  }
end

return config
