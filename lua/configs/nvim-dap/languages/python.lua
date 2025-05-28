local M = {}

M.mason_package = "debugpy"
M.adapter_name = "python"
M.adapter_path = "debugpy.adapter"

M.adapter_config = function(adapter_path)
  local adapter_venv = vim.fn.expand "$MASON/packages/debugpy/venv"

  return {
    type = "executable",
    command = adapter_venv .. "/bin/python",
    args = { "-m", adapter_path },
    options = {
      source_filetype = "python",
    },
  }
end

M.filetypes = { "python" }
M.configurations = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
  },
}

return M
