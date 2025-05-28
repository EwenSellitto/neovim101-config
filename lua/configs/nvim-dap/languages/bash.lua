local M = {}

M.mason_package = "bash-debug-adapter"
M.adapter_name = "bashdb"
M.adapter_path = "$MASON/packages/bash-debug-adapter/bash-debug-adapter"

M.adapter_config = function(_)
  return {
    type = "executable",
    name = M.adapter_name,
    command = vim.fn.expand(M.adapter_path),
  }
end

M.filetypes = { "sh", "bash" }

M.configurations = {
  {
    type = "bashdb",
    request = "launch",
    name = "Launch file",
    showDebugOutput = true,
    pathBashdb = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
    pathBashdbLib = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
    trace = true,
    file = "${file}",
    program = "${file}",
    cwd = "${workspaceFolder}",
    pathCat = "cat",
    pathBash = "/bin/bash",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    args = {},
    env = {},
    terminalKind = "integrated",
  },
}

return M
