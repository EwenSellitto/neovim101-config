local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

-- local script_dir = vim.fn.stdpath "config"
-- local clang_format_config = script_dir .. "/.clang_format"
local clang_format_config = "/home/ewensellitto/dotfiles/custom/.clang-format"

local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black.with {
      extra_args = { "--line-length=120" },
    },
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua.with {
      extra_args = { "--config-path=/home/ewensellitto/dotfiles/.config/nvim/.stylua.toml" },
    },
    null_ls.builtins.formatting.clang_format.with {
      extra_args = { "-style=file:" .. clang_format_config },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

null_ls.setup {
  sources = opts.sources,
  on_attach = opts.on_attach,
}
