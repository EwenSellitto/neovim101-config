local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "csv",
    "dockerfile",
    "doxygen",
    "git_config",
    "git_rebase",
    "gitcommit",
    "gitignore",
    "html",
    "javascript",
    "typescript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "make",
    "python",
    "regex",
    "toml",
    "yaml",
    "xml",
    "vue",
    "rust",
    "prisma",
    "json5",
    "go",
    "vim"
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "pyright",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
