require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>le", ":lua vim.diagnostic.open_float()<CR>", { desc = "open floating lsp diagnostic" })
map("n", "<leader>qf", ":lua vim.lsp.buf.code_action()<CR>", { desc = "lsp quick fix" })
map("n", "<leader>cc", ":CodeCompanionChat<CR>", { desc = "open code companion chat" })

-- ===========--
--  Lua dev  --
--===========--

map("n", "<space>rx", "<cmd>source %<CR>")
map("n", "<space><space>x", "<cmd>:.lua<CR>")
map("v", "<space><space>x", "<cmd>:lua<CR>")
map("n", "<leader>e", "<cmd>:Oil --float --preview<CR>")

-- ============--
--  debugger  --
--============--

map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
