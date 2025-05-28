local M = {
  mason_package = "js-debug-adapter",
  adapter_name = "pwa-node",
  adapter_path = "$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
  adapter_config = function(adapter_path)
    return {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { adapter_path, "${port}" },
      },
    }
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  configurations = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      sourceMaps = true,
      processId = require("configs.nvim-dap.utils.pick-process").pick_process,
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
      cwd = "${workspaceFolder}/src",
      skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
    },
  },
}

return M
