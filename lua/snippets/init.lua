local ls = require "luasnip"

local function require_lua_files()
  local current_file_path = debug.getinfo(1, "S").source:sub(2)
  local current_dir = vim.fn.fnamemodify(current_file_path, ":h")

  for _, file in ipairs(vim.fn.readdir(current_dir, [[v:val =~ '\.lua$']])) do
    if file ~= "init.lua" then
      local filetype = file:gsub("%.lua$", "")
      local module_name = "snippets." .. filetype
      local module = require(module_name)

      if module.filetype then
        if type(module.filetype) == "string" then
          filetype = { module.filetype }
        else
          filetype = module.filetype
        end
      else
        filetype = { filetype }
      end
      module.filetype = nil

      for _, ft in pairs(filetype) do
        ls.add_snippets(ft, module)
      end
    end
  end
end

require_lua_files()
