vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

-- Set tabs to be 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set end of file linebreak
vim.opt.eol = true
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  space = "·",
  nbsp = "␣",
  extends = "❯",
  precedes = "❮",
}
