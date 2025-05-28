require "nvchad.options"

vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "120"
vim.o.conceallevel = 2

-- Set tabs to be 4 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Set end of file linebreak
vim.o.eol = true
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

vim.o.list = true -- Enable the 'list' option to see the characters
vim.o.listchars = "space:·,tab:▸ ,trail:·,extends:⟩,precedes:⟨,nbsp:␣"

-- check of os is WSL
if vim.fn.has "wsl" == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
