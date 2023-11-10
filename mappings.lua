local M = {}

local function quickfix()
  vim.lsp.buf.code_action {
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  }
end

M.disabled = {
  n = {
    ["<C-n>"] = "",
  },
}

M.general = {
  n = {
    -- Tmux navigation plugin keybinds
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    -- LSP stuff
    ["<leader>qf"] = { quickfix, "lsp quickfix", opts = { noremap = true, silent = true } },
    ["<leader>le"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "LSP diagnostic open float",
      opts = { noremap = true },
    },

    -- Telescope aliases
    ["<leader>tm"] = { "<cmd> Telescope marks<CR>", "Telescope marks" },

    -- Nvtree
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

return M
