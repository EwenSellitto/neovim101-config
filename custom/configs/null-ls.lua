local null_ls = require "null-ls"

local script_dir = vim.fn.stdpath('config')
local clang_format_config = script_dir .. "/.clang_format"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp / c
  b.formatting.clang_format.with({
     extra_args = { "-style=file:" .. clang_format_config }
  }),

  -- python
  b.formatting.black.with({
    extra_args = { "--line-length=120" },
  }),
}

null_ls.setup {
  debug = true,
  sources = sources,
}
