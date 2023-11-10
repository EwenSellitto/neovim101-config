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
    "prettier",
    "prisma-language-server",
    "vetur-vls",
    "eslint-lsp",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cmake-language-server",

    -- python stuff
    "pyright",
    "black",
    "mypy",
    "ruff",
  },
}

return M
